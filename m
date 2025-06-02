Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9717A303
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847825; cv=none; b=YL3V+PfI7PPSmj1JgKWV9WGUCFtELzzEjNSSGm+dP6Fx6caLioFlVJ3HC7jE6AnvQTH5LK8GfjPCMWXrWfpD9KyUT3vDKNv/WPPRHAarX6lUuq4djYyr46kZhJqlhHrPJ2WcuYkBRS70P35Bnx8QD682YjeEH72ko0gMkjXUzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847825; c=relaxed/simple;
	bh=aZCJcblbElIitQlmWiG8blGEDXgzlXYgqJYCQ/VgPns=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/+tX7UgAT7/KUfYDCiAOnDg7HFyEQQNa/2zDrrKZgXRiOrNrVKzDNGZAUYSp23IG1TOD5oMWyus/E9W5Bphh7slCCAUigfZH893DL46XBRcVfNOKtfGEmiRtzAIGWksdzA7bI9A7vG4jVmp+P6KF5LqE7RnrdEpUmNQKJ16TF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 55272pLT020253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 2 Jun 2025 15:02:51 +0800 (+08)
	(envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 15:02:51 +0800
Date: Mon, 2 Jun 2025 15:02:48 +0800
From: Leo Liang <ycliang@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <rd-sw-linux@andestech.com>, <daniel.thompson@linaro.org>,
        <rmk+kernel@armlinux.org.uk>, <ying.huang@intel.com>
Subject: [QUESTION] NMI: Understanding ARCH_HAVE_NMI_SAFE_CMPXCHG usage
Message-ID: <aD1MmIi8o2vyi-Zs@swlinux02>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 55272pLT020253

Hi everyone,

I came across the `ARCH_HAVE_NMI_SAFE_CMPXCHG` definition recently
and could not fully understand how an architecture indicates its support for it.

From my initial review of the code,
it seems to indicate whether a compare-exchange operation is safe
within an NMI context (handler) without causing a deadlock or other issues.

I have checked the initial commit and the architectures that enabled this config
with that commit. My inference is that if an architecture implements cmpxchg
with a lockless algorithm, it should be able to enable this config.

The reason is that I can only think of one constraint: "taking a lock"
should be avoided in an NMI context in case the NMI encounters a deadlock.
Therefore, if the architecture does not use interrupt masking and locking algorithm
to implement cmpxchg then it should be safe for the architecture to enable this config.

However, PARISC implements cmpxchg using interrupt masking and a while loop[1],
and `ARCH_HAVE_NMI_SAFE_CMPXCHG` is also enabled for this architecture, so I am
unsure if my inference is valid.

Could someone please clarify the specific implications of this definition
and in which scenarios it becomes particularly critical? Are there
any specific hardware capabilities or kernel architecture-specific APIs
that govern its presence or absence?

I've searched lore.kernel.org and kernel documentation for a detailed
explanation of `ARCH_HAVE_NMI_SAFE_CMPXCHG`'s history and current
usage guarantees, but haven't found a definitive overview.

Any pointers or explanations would be greatly appreciated.

[1] https://github.com/torvalds/linux/blob/master/arch/parisc/lib/bitops.c#L59

Thanks,
Leo
