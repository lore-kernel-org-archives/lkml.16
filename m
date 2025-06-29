Received: from mail.oetec.com (mail.oetec.com [108.160.241.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99C220F32
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.160.241.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751210118; cv=none; b=QI5bhZglzo30PYeBRs8D9hFMvavNEvVaJs2vfAkbisin2SCLi57jPd0U9bQXlVH6Hzkb3pY0OHhzTaVeh9kP6/3AaF8rWLsSpS+0CDyEpGssUYHDgg5yM78vDPQ0fQXl3b8gO/O1Q8CLhfPGC/nxgYVWfA0PF8PQUl28OKVuNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751210118; c=relaxed/simple;
	bh=cIMCtA16WnTXZAfGZQrbt7X2MXUZryhnQR8KXjmns/0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K6ZhzUFp9+eTo4agyF9ZS19N8n0Crrg9v4rSHDpRtIloI8nxQmGCTa8z/hC6vXjrYhkUU+WCfOQ3LWK4kneUWiFJrWo7KbsDN5vsFcmBy5b8DI61mWG5WrQiJZmniMX2V/lxO3vK1eXU9lzhr5jUuRFR855p5o5SjAExole263Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blastwave.org; spf=pass smtp.mailfrom=blastwave.org; dkim=pass (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b=LTE8OHGl; arc=none smtp.client-ip=108.160.241.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blastwave.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blastwave.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b="LTE8OHGl"
Received: from [172.16.35.3] (pool-99-253-118-250.cpe.net.cable.rogers.com [99.253.118.250])
	(authenticated bits=0)
	by mail.oetec.com (8.17.1/8.17.1) with ESMTPSA id 55TFFDlF073267
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 11:15:14 -0400 (EDT)
	(envelope-from dclarke@blastwave.org)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blastwave.org;
	s=default; t=1751210114;
	bh=cIMCtA16WnTXZAfGZQrbt7X2MXUZryhnQR8KXjmns/0=;
	h=Date:To:From:Subject;
	b=LTE8OHGlSahvTpbN74wz+PjmWCL0UYxzkMADZBw15aYsS0gRYK9Pdhpn/q4Ak0ZR+
	 gA+8msQAcLxjoXk27TJ/nLgJqEK80K7d/4Oi3ObKDuTUJKnfuLhRQ2D2VlmpH54rSA
	 dnBiSPau7jP3qVG/H944Bw8w/1+tBWchxSDuEc+ENYyMn2H7/iM3bW9d+6BAC/RXZV
	 mtsK7DklTO4kA7W/gEEa3Yqoiqw8mw2kSJyMDg89v53I4gr3maCA9W/XyY/YjmQJ50
	 WhWGzsBRY2YXA/pxLd/JVZCwwywHxzGeXwdYnuko73NyzfFEEYxyIo+Wqzzhjiurw1
	 PWqDAsmO42A7w==
Message-ID: <e4742cae-9ef5-4d30-8c88-65f69e2178cd@blastwave.org>
Date: Sun, 29 Jun 2025 11:15:13 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
Content-Language: en-CA
From: Dennis Clarke <dclarke@blastwave.org>
Subject: arch/x86/Makefile REALMODE_CFLAGS needs -std=gnu11 with recent GCC
 versions
Organization: GENUNIX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-oetec-MailScanner-Information: Please contact the ISP for more information
X-oetec-MailScanner-ID: 55TFFDlF073267
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-From: dclarke@blastwave.org


Code fix for due to https://bugzilla.kernel.org/show_bug.cgi?id=220294

The summary is that recent GCC versions ( 15.1.0 today ) will assume C23
spec compliance and get upset with ye old A20 address line code bits.

This problem exists previous to the 6.12.35 release tarballs and is
fixed with commit b3bee1e7c3f2b1b77182302c7b2131c804175870 applied.

The newer GCC revisions will be quite popular soon enough and this may
bite people when that happens.

-- 
--
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken
Beard and Suspenders installed
