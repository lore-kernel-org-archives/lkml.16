Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF41193077
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229891; cv=none; b=KeQ7kQBUhOUHLFXIegkuxT6bAp7/EnVp1GPCpoXyNQtAJUhHPGbhATa2c2Ro2jzvGI2ZDFGvrDroll6TXXLJNlv6I2BUfmJZPYeyd+4u8NoXn2bp9hEnz5PvG8JW3L4JBXpyiNbeScTXNaIozdoEYwOTbxfQoyIzvVTsYNRuXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229891; c=relaxed/simple;
	bh=NLNN7vCVXyiR0ayNfpvRKNcGJb9PQtAyHKskHr8S5hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVbLWBZwID0yzn0uyyK2iRm/diZ7sg1jccFmw10qLa4hiyDIKnMRt7AHXlUOEk23gbfzF77Zv8hd4O2BUhrKRQ+EUIp9SAW6uQDEn0yUsIwe5l5+GmmLHKCjf61sA8PycpsZnG0js9Owz2v8Mf+0gfaLZ2cSTVyzfyLC433MdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=jcQa6n9H; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="jcQa6n9H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yk6P75G2qGM2ZXU75/J8qnGroLQKLRR9aKxZrgtAeJc=; b=jcQa6n9HK2tTZBmkUdiiXEPMty
	dF3wSMYaujs0L2OxWO8MZRxO1umIQZBJz63RK9IF1Lbvctl2BAxuAzyL78ALLGFDapp0dIOFJo3uV
	CaHlZzbj8gTSU9XeoVJl52thbYTKHmo3IOetXDUBpa+cO/tPrtyeqoHTWCldxsSzT8oLGw1C4yOim
	9k6FJpYv3xsQmVDckfcjZUsdXZ2UrFAYgU7YNQMY5icfrZoMsr+/aDTUlCyuX9bbz11CvNv/MpuG7
	2/zkLGNVTJhL7bJhwt8bKxPsVx3qjJTrXjQM6IxfALcdafaToY13yuqkFZ8+bT1QF5wS1j3bsHIPd
	ZM325Fhw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNab3-000000006Se-1UKN;
	Fri, 06 Jun 2025 13:11:13 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	mingo@kernel.org
Subject: [PATCH v2 0/3] x86/mm: TLB flush fixes
Date: Fri,  6 Jun 2025 13:10:32 -0400
Message-ID: <20250606171112.4013261-1-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1) Fix a potential overflow in user_pcid_flush_mask.
   I do not think anybody is hitting this in practice,
   but they could if they wanted to.

2) Change the early boot initialized value of invlpgb_count_max
   to 1, to avoid an infinite loop when...

3) Having cpa_flush() call flush_kernel_range(), which results
   in the INVPLGB code being called very early at boot time.

v2:
- changelog improvements (Dave Hansen)
- get rid of #ifdefs in .c files (Dave Hansen)

