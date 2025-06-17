Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51771E8332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175030; cv=none; b=EhMP6dHVUezTNlwbUfzvbDxvyXcwzP+RfqDQEc5LrHxi19fDEyFYTTZYmh350P5SEuirOI6uvoKlQdutUB5q51gJPg7PnsZ12YiJ355XZXAUm8CXLHs8gKRmGdG3CQQBDDLMYPxAYCEnoNPjKOZDl3RULZvrybLRpl7TVQUmti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175030; c=relaxed/simple;
	bh=gojLBIG1GfBfEK+BJinhqciB5+7LPA9ofH5Eor64FuM=;
	h=Message-ID:Date:From:To:Cc:Subject; b=QhBOhZtIaMKe10fcggqTrRrL7gK+/p5gdioAeNIXyhkG/TTIF9HcD5FmcxDHYN+L1tl3gYsrEU/dkLTtXRhaDTwoGgDIDZEX45Yc/wxxNsegQFYyz0e5swhQN453dcXqW/0SiITpG5ZoCGmfymHRD7kwoBC7zSdnjYffbPz+CnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 83105140405;
	Tue, 17 Jun 2025 15:43:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 5F6F917;
	Tue, 17 Jun 2025 15:43:45 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uRYTX-000000029Go-26Nw;
	Tue, 17 Jun 2025 11:43:51 -0400
Message-ID: <20250617154303.952651744@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 17 Jun 2025 11:43:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: "John Warthog9 Hawley" <warthog9@kernel.org>,
 dhaval@gianis.ca
Subject: [PATCH 0/4] ktest.pl: Updates for 6.17
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5F6F917
X-Stat-Signature: 9juhffteh5xwcqgbokcffjdupnid3rrd
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/XaWVLaTOg5c07PW7Ny/X2fPgPslS/3D8=
X-HE-Tag: 1750175025-21049
X-HE-Meta: U2FsdGVkX1/9VjAR1JaySvoPJre8aPNxYbzGvD091n9PyiFxk8pCVjOF6FYv5ldndKSfDcIkhylDdWX1fBmWw7ES50N2IBZUpR16ytMpGE9pJV9uWI8YUUDhR3j+Z9rKcZnGbsOMKOy59Vb9Y8plHvVj0N6bVYa7hsvLrtrOLjQhz0Ta9Fv5x+/3VkldTgxdA1KWZs75lbkVrKnspJiRLwl3yTAhDLSDpNTHt6C1WrbT9i0/27pgl/agQ+GFqM278oNcJpaxDm8uShg0eNWaVH+gAh1uR1L9lnItgCwIOPc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


ktest.pl updates:

- Add a "-D" flag to allow overriding the content in the config file.

  Instead of having to tweak a config file for minor changes to run
  a ktest.pl execution, allow for config options to be overridden by
  the command line:

  ktest.pl -D ADD_CONFIG=/tmp/temp_config machine.conf

  The above will make ADD_CONFIG default to /tmp/temp_config

  To have it work for a specific test, add "[<test #>]" to the option:

  ktest.pl '-DBUILD_TYPE[2]=allyesconfig' machine.conf

  The above will change the BUILD_TYPE to "allyesconfig" for test 2.

  This works for temp variables as well (using ":=" instead of "=")

  ktest.pl -D 'ARCH:=arm' machine.conf

  The first "ARCH" variable will be overwritten as "arm". Note if
  there are more than one "ARCH" variables, it will not override the
  later ones.

- Check for recursion in processing default variables

  If a default variable has itself, then do not continue with it.

  ADD_CONFIG = temp_config ${ADD_CONFIG}

  Expects there to be a: ADD_CONFIG := other_config

  But if that temp variable "ADD_CONFIG" does not exist, it will use itself.
  Do not allow that.

Steven Rostedt (4):
      ktest.pl: Add -D option to override variables
      ktest.pl: Allow command option -D to override temp variables
      ktest.pl: Have -D option work without a space
      ktest.pl: Prevent recursion of default variable options

----
 tools/testing/ktest/ktest.pl | 79 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 3 deletions(-)
