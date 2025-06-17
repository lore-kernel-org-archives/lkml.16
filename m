Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D622ECD2F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175030; cv=none; b=hUoXeOBoBKbK6XMCyZqjfSvL4P3SZ+jkSHohtiLRIUO06djqPeKy3XuZHhcARc7a1dHGVrZY1hI+lSGkOgefDokJ5KiKOURfcuVxHKdrZMkFseCjLhHam3auHh4/HtrRjl0XRdVaJLw2G37py7axUykFz0yP+gJj59C5SaK+9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175030; c=relaxed/simple;
	bh=jRP/zOTvSPvZdc4E51dkUoMDxpQIXxmewk+hZU8kexs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=g1BmVU3DHfK3QFUOvuby9yTGGWEdcCMUeeT9fd/t0vAPgfqk59rNT5SY1fin3PRDWo4/TPszlpMVoRPzt+iib7QuFSKIW5ptGR0Yz53AYJqoVwjHn24gw2vD2bu7GCd1MCsurLclpdLiCvAK/2tEvW4SnJIJzNKrnI0S6Mhou5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 682CA16038B;
	Tue, 17 Jun 2025 15:43:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 15AF920026;
	Tue, 17 Jun 2025 15:43:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uRYTY-000000029Im-0jZS;
	Tue, 17 Jun 2025 11:43:52 -0400
Message-ID: <20250617154352.029415598@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 17 Jun 2025 11:43:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: "John Warthog9 Hawley" <warthog9@kernel.org>,
 dhaval@gianis.ca
Subject: [PATCH 4/4] ktest.pl: Prevent recursion of default variable options
References: <20250617154303.952651744@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 15AF920026
X-Stat-Signature: wdodbgohwd9ygn7xaq35pqccefxe9m75
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+OouqrzNlLVePYxXFGDt9gvobDCRBInqo=
X-HE-Tag: 1750175026-974625
X-HE-Meta: U2FsdGVkX18Y3YrxJaNV8qiye04dkatnojpJuM/yquJ5WuuFaVTjRxojnANsI0Edorew26BcdTIvFUReO47oXzC24nFidtmwj8zRza0bxXpGNAu6IfTnzQWLmoOMh3EEaJOfJ0Uf2eGxH0qY/oRodkAnr3mFKSlXa5KlDMr1jFIhaLw2jDAda8qMi6vUQO+h9z2YJkfkXGyI5evIinbDQSd5zYYU8LlpVA+R/acPelguaeU4yCh/2MmSPVXKKev53pgC1eoOl+Wqhi8f6rdPBfODKe8LD9wEz5G21GwHwvw4iwEwWnpsGMhVGl6yGC7ykW75eAK8WDKPqylzJVZBd2umMIALum1jBz27zeHRxn36mNuxsMldCBlM+WqUouikRGjkbfsFofgKovbxA6jX8Q==

From: Steven Rostedt <rostedt@goodmis.org>

If a default variable contains itself, do not recurse on it.

For example:

  ADD_CONFIG := ${CONFIG_DIR}/temp_config
  DEFAULTS
  ADD_CONFIG = ${CONFIG_DIR}/default_config ${ADD_CONFIG}

The above works because the temp variable ADD_CONFIG (is a temp because it
is created with ":=") is already defined, it will be substituted in the
variable option. But if it gets commented out:

  # ADD_CONFIG := ${CONFIG_DIR}/temp_config
  DEFAULTS
  ADD_CONFIG = ${CONFIG_DIR}/default_config ${ADD_CONFIG}

Then the above will go into a recursive loop where ${ADD_CONFIG} will
get replaced with the current definition of ADD_CONFIG which contains the
${ADD_CONFIG} and that will also try to get converted. ktest.pl will error
after 100 attempts of recursion and fail.

When replacing a variable with the default variable, if the default
variable contains itself, do not replace it.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 tools/testing/ktest/ktest.pl | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index 075c386af5e5..b2971430d7e4 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -1394,7 +1394,10 @@ sub __eval_option {
 	# If a variable contains itself, use the default var
 	if (($var eq $name) && defined($opt{$var})) {
 	    $o = $opt{$var};
-	    $retval = "$retval$o";
+	    # Only append if the default doesn't contain itself
+	    if ($o !~ m/\$\{$var\}/) {
+		$retval = "$retval$o";
+	    }
 	} elsif (defined($opt{$o})) {
 	    $o = $opt{$o};
 	    $retval = "$retval$o";
-- 
2.47.2


