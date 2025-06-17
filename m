Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734652ECD2A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175030; cv=none; b=jHUtgqymxbJQTb0ugzUZau1KGChlItlDwpKoa/szouNTR3b4N9EPhuTgY/LXJ7ewtR3vmNKtZejaIprW1IXhjQxyzOoC3JvxHZLPZcqp5O/QjeMH36vI4AmSvAuUfsFnuE210Iji9elzDUd7x84oVkJQp3LJdiVqdbaxMy8LYEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175030; c=relaxed/simple;
	bh=rg4fTUaMM/kHfvtLxs2wKzoNwqSYHAn9IkmBpAPV87s=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=NXCTqAFm5/QB9SK7F8NKgkhu4wzIBm0T1YIGZ7vrtlnvyidS/aSXPOA/EUhilbFHY7NylYuA04Fmpdf3olyEWq1wHsk3q68Gac4S7ytfN7ENRI33VxIiqXzC2KCi/aipge5nw8ijmtAoo5RXpN1i/pU1K1aQ227NghiddMr6lWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 19AB9160530;
	Tue, 17 Jun 2025 15:43:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id D021220024;
	Tue, 17 Jun 2025 15:43:45 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uRYTY-000000029II-02Qv;
	Tue, 17 Jun 2025 11:43:52 -0400
Message-ID: <20250617154351.862558407@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 17 Jun 2025 11:43:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: "John Warthog9 Hawley" <warthog9@kernel.org>,
 dhaval@gianis.ca
Subject: [PATCH 3/4] ktest.pl: Have -D option work without a space
References: <20250617154303.952651744@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D021220024
X-Stat-Signature: 5453fxy7qiegpd4i1rw837t4nuuambma
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+4tpKgCP2cFvbxCCAwLV2d6Z9ZlwSYfsY=
X-HE-Tag: 1750175025-793769
X-HE-Meta: U2FsdGVkX1+qZW0H3WOiRIUTWM4AXpfPUX3rmGhfMtjDgPNvd+9R/lwJTqqW6Oe9L74tapjTADVQBCN57/vzF3Y1HhalzdE6sX0sViSw4ixy/QElkx93IbO1MIhigeY25Kujfwuhop3KeSCnaqRnePDK4M2GYn5jqNODUieqCfsHsODjzPqgx/v8TGjVVhyeLHH6tx++oNPM8rQNSvuyT3AyirgxtKU+33wfMm0JLtuCM8d4Sxdz6hgxFqDqyW/+V+WOoHRWLgeqEFghqfsOTHV+728HYR3SmeuwefI4vNP+6rFuZd4wvlpVodKnyhvaOmJ3opWyuMI9Ymr9S4IToL36vUiwtkAwPTlUW9e6Y7KVQZPofe3tefiVEdbvoWW2YQkdlUxjuTHt86byzjqr4Q==

From: Steven Rostedt <rostedt@goodmis.org>

Allow -DBUILD_TYPE=boot work the same as -D BUILD_TYPE=boot just like
normal single character option does in most applications.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 tools/testing/ktest/ktest.pl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index c441934f1def..075c386af5e5 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -4297,6 +4297,15 @@ while ( $#ARGV >= 0 ) {
 	    $command_vars[$#command_vars + 1] = $val;
 	}
 
+    } elsif ( $ARGV[0] =~ m/^-D(.*)/) {
+	my $val = $1;
+	shift;
+
+	if ($val =~ m/(.*?):=(.*)$/) {
+	    set_variable($1, $2, 1);
+	} else {
+	    $command_vars[$#command_vars + 1] = $val;
+	}
     } elsif ( $ARGV[0] eq "-h" ) {
 	die_usage;
     } else {
-- 
2.47.2


