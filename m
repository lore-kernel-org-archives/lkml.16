Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7A29CB3C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023808; cv=none; b=GhXE4WhF/Vyk3QZ5Rp/nEtrA3Q8gAhlsRYDclV4HypDSOOPHYDete7K4EHw0Aow8IO/vpKPo0Qcxlgfeyu4AXiHdZBNJ3bsu1tBOhYCC6ToDgcB4GW+/Vtdu8rVzJ+zYI1RSqSkFW7XVgK2SP+wjIH8zCEy8jfkEbzljVDyyCLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023808; c=relaxed/simple;
	bh=zKCqTgjmsvUS/CZo4YC2wBwYHN+PAOj3t6dtU61EBIo=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=O0MPd1SKWGzKruqXsduPDwDHVf+D5JAmyJwcck4DsPcHfLojcu0Cpb7ZJNK3Jtng3FoREQ5vgND9Chg7MS3+LCWWidQZgC8ruDN0b//SN3yWe/JJ3inOyXRFX2YSdy7yaRYfiXNi/lsz+EobUNmMxLdh7U146DBoH2a5flx1rq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=cNiVjLij; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="cNiVjLij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To:
	From:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0akcOW2gYFSf51i2ugkmfmThX8pSKjWE5TDslO2xpjk=; b=cNiVjLijduAidhx/XhScghm16b
	hUP6QpTC64zS4Uf6AW8dMRHBDD+e0c5S+VPUrISes0cV9Xs5Or6308ihE7MloUoUWfu0cYEK2oyvu
	KbdrWUFO4m6smJ6N9LKZkOwQjB7OyZ0MpJnG4UM0DZRqrTSC+M/xFF8PClKNVweKb80Y=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uV6UG-0003e6-Hr; Fri, 27 Jun 2025 16:09:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 16:09:16 +0530
From: siddhartha@kenip.in
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_perfor?=
 =?UTF-8?Q?mance_gain_observed_in_AI_inference_workloads?=
Message-ID: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I wanted to share validation data from a Hugging Face-based AI 
inferencing workload,
which was significantly impacted by the THP alignment logic introduced 
in commit efa7df3e3bb5.

Using transformer models with dynamic input lengths on Intel Xeon 
(Cooper Lake),
we observed up to a 3200% throughput improvement after applying the 
patch from Oct 2024:

   mm: limit THP alignment of anonymous mappings to PMD-aligned sizes

Metrics:
- Model: BERT-base
- Inference engine: Transformers + ONNX Runtime
- Kernel: 6.6 vs patched 6.6.8
- Batch size: 8-32, input length: 64-512 tokens
- Metric: inference throughput (samples/sec)

Thanks for the fix -- this change had real impact on a 
production-relevant workload.

Best Regards,
Siddhartha Sharma
ISV @ Kenip
Solution Link: 
https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
