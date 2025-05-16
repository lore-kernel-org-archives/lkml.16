Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B862AEED
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747419109; cv=none; b=OcnfGpgST1xLbbJKIY5msQG1ib8tBrAcL+bu942Iy9kCk3SWfmwRn3wkx9qXbFM1FoMAJL1/A7AlacV4PHW7p5DvnNVNlHt5au08nArV/p+BJAmKeUybPQNGheu6s1ZYxMBnB8Wyi04lG6czELofHqE7Jfis1sVfNHS36AOH3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747419109; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=nSNAjDTfoflni2ElWbJSK9FCJ6Td3n4BINFGQkfFdJUeVOdlFVGI7X4fSJEu3y5vVtlZT4ysrMs1Z1CaMz8sEC8iDr0YizpH7zyAi5zJN4gFbQfUNd4K5qo7wMiGz8e6Me+VFY3n0DQowvj1VH0mrYJoTxrtj6F9yk9eVRYnvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com; spf=pass smtp.mailfrom=savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=WPMJ5fq7; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="WPMJ5fq7"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9FAE59C0D9F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:05:03 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ddtRlsN_gMKg for <linux-kernel@vger.kernel.org>;
 Fri, 16 May 2025 14:05:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4533F9C9014
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:05:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 4533F9C9014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1747418703; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=WPMJ5fq7P99kECqjJQxBaQY70Jy+YXq2tmbWPRzyxUNhCibq3N94ddQEpiLDBJjxV
	 +gYBrXiNjF/tmDYn+PL6CkEvAX2M5yjeTWyMY5Gp0qYijyMAEognFYmbsafUPw88vP
	 7Gw/YEvJzr+XrpAMRic7C1oxNWi2e3V7cRda18H24rd1+UVbLZwjHBM0fDnwKY/LjV
	 6WupM2tLi2JwzHK89H4KYCzu409RVOQJu88FlzCSIJJEl9oJDaDsUnr5XcQbrtmEjK
	 nlosiYN+oJgk4DmJAefRVn/MXNlMP4sC6nPjbAQ98FdyvtpbzaiZATx0YbcXikGNMk
	 056CBIkCrEbCQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2EexZtSOcTqk for <linux-kernel@vger.kernel.org>;
 Fri, 16 May 2025 14:05:03 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2EC849C0D9F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:05:03 -0400 (EDT)
Date: Fri, 16 May 2025 14:05:03 -0400 (EDT)
From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1139625243.793562.1747418703159.JavaMail.zimbra@savoirfairelinux.com>
Subject: subscribe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 10.1.1_GA_0424 (ZimbraWebClient - FF138 (Linux)/10.1.1_GA_0424)
Thread-Index: tTL1iH96QmQLqIHcwEwEUu/KVLGi+w==
Thread-Topic: subscribe

subscribe
