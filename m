Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D31D6188
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082612; cv=none; b=BhsdB+LUKh2D3T4V2L9kAugU9tqIdaXBaDWUU6K4SHgJyakFhaJbyLgErs3l+EpYlbivhs4CjjAcnUR2nYQqfTy7fhefuVmvM5SAPBEp/CLLAX8ToILBv94ofVXcu7PXgAHG9qr7tkUlwq9kZ2F9NJnlADALI6yy2E2otWYsOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082612; c=relaxed/simple;
	bh=JO2DVA5a3HV+i3BWwWTQYfMByP2lmbmi28yHxOFU1Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTFgcZUnmBXUlO3YJj5KEaYk/tTZ9aSX82YGISfeiVoOfFXMF6kVeUnTDjQycwply718QPcAUCSTwbdobgBCOsEbpJ0u1HUVaVDpvbnBCayM3F0wOSKjsptEMAa2x2mqw3jXhdcEnfJWO82vGPtWScAHmbUbUZY6sYcZsIL8Pto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NkOq7Mw9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NkOq7Mw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
	b=NkOq7Mw9JZqSR3eNC3D9+6PHDoqWFih7EyTd+dyHmYW/31vdKLEBP7MOrpvLHDnE/TVSRf
	98XUxXCR3Axiubzo8KaOvsAshrYiMVrNcf/MT27J0K59d2Ft3838pOsSmUM95jgsRIcxIB
	MyzWx3LINQj8n4XwuN4Ape27pqS0VfA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-n-Qvwc_wPgKH2bUrdY5lLg-1; Mon, 16 Jun 2025 10:03:29 -0400
X-MC-Unique: n-Qvwc_wPgKH2bUrdY5lLg-1
X-Mimecast-MFC-AGG-ID: n-Qvwc_wPgKH2bUrdY5lLg_1750082608
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so1797488f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082608; x=1750687408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
        b=WaPr06+J97rCmeSn8uuY0MBuFhM4KF9sRH6qNwBHunML4TQ/PmPiZeGqezVY/FsN96
         T4Ct6qB2QpXGkpjB7l6Aq7gmsEPPD0gkIn5plcj9GZAQcWgsQUkmcAjMgo8sf0tgafIr
         GCWI/x6BU/sCjSgBQRCG9moNvQOHbTmCYCnZD47LFFCfwfeY2bYpDFRN+itT7RsoN+ZL
         X4SKN2WRhqOvek/IqceJQxIPkl1qtKbvQgG2l6ksHyuocoTVnBPUfbbxqpEmjcYddIxN
         1Msfn4uquMKKQlKf1/M4k4iQElxN/FJR4gKIM+5n1URvGvvCMVdZ5PrI7pFELG1TxbpZ
         MvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt8xTXEry3NwDmscPIjXiItFiD6ghDXNExP8WcuC3Yu6cqG/O8KAg1C+Nu4bR7TP0nnECVyiM7ctWq44U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw94vzV0iNOiCvqbB2a6TtxDOK6Zb34P6g2OjCG23YIEzACkm9
	5KExIN3Pavbwg1rqhx3HCr5pqN2nZeG5YPVzE5mYEkZFBgDRS5C54k3OISFcMk+RThcrSi0dj/w
	K8irqYeNei3a4qYAQEYZfwRMHgSiXJNm4VY9+ipQebaTQJcSWA31wTDeVuGPpHqFDwA==
X-Gm-Gg: ASbGncvReLTLCWfmm0yV1oXSgIaMWRu7GfwW7LavgUMTC676JOaQcJoR5E1wRig2ssE
	x2Ob4ak7gKBFsRstOpt7DaRsYEpUqNjbN7LdQxHEFo0AhYPa6OPpuT7qDzrFfd6oMnFTmEnNJCg
	Z+tYJDts3+ZV1uGCJ7UT1mxlANhAXWdairfAmcwYBvKtCvijWFPS+cQD+QczL2/sMsjVwR4V1Wq
	FQ9fqR2S881Lr1OwI9mMpwvA1KXMuQs8HDB8o2jyEjYVwyRZzwwoPbhKWca94T30iIShzWmV4NG
	veyl/ZndLJ+ixamDH74Kg1nJf4esDPdAW6c7Hv89e2Uls0GRe7UClg==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8627010f8f.53.1750082607434;
        Mon, 16 Jun 2025 07:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhnN5lqHyekM9U5mFuJ4VnEOh6SefVAzY1bT/B5jogeMQLSgptuYNFVoJKZP5a2pKpaGM6cQ==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8626772f8f.53.1750082605375;
        Mon, 16 Jun 2025 07:03:25 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d7fsm11345085f8f.18.2025.06.16.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:03:24 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:03:20 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFAkKGs5h6kfXYnO@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>

Hello,

On 14/06/25 10:04, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
> 
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
> 
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> So it will scaled to 238,418 ns.
> 
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---

Right, I would agree we don't actually want to scale fair_server runtime
by frequency/capacity. Your change looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri

