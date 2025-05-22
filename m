Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC092914
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909094; cv=none; b=V1LgSvgsKeQrJy7QCG8L9RED8z56JZCK4pDke7JbsaimDKlwYyjTTqNh5LLtHU8QESMSpPyUAwo0Meu3zLalRHb0Ld0KZawo16wg62ssQG/PCTJwEd4uvOdwuHFxXMS7+ksXzzSwFgP52EVNGPOMftu8lq0cn1S88c7/WWAiDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909094; c=relaxed/simple;
	bh=fXRXSXan0RNfY2ps5LOBB5DdJ3/rkPH6+iX8zJ/1khQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQMQAC5Vggw0gIrq6FWoU4flGnYzdeEDVtd4YzEtbHapzcdLS/agj6erH1oVYvZ85yUncwhM0WortzjMNbOcNDm4vFmgE1eQIeNgHUYw3TynjgD/fgfCTl2NAMXA6lSVbX2erWhrcTQH+c+SwudyqEa8qC0Zm69qlt9tMLLElBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VaEwqOYN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VaEwqOYN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a375d758a0so3100411f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747909091; x=1748513891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lTxLQbcf5h8Drc8Nt7tKIbPRq/9AoHvN7/uGznahvzw=;
        b=VaEwqOYNNAktiNtsQ/smSYIsKkmDv0DWrHBN/SLQ+RfiKx2Fz78hsgS1KkiXO6qnt/
         c1WMo+k9b1Cs2TVuydaW3dvrd5X8to9Oe6vVl3ZVmOlqr3n4ATANKg+63AiTKqWhSVMi
         7nrzW79mpB8y0jffTTtu9a3XyOx6UthyM09zP8F2J1es6Dff/6O2EW902bsAM6HxKaSr
         lDN578+w/iXnzvE4VxjvhYEycJhYJ3GAPIZ/6SA44iqmIWUVi8qmiKToIE4d5zLG5CTk
         qXMT/i6JlI/8MniAj+ZevO0SblKIIkvthajRx2yu3pC+Anc26ThLN/xnOog9JYvl7OC1
         xmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909091; x=1748513891;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTxLQbcf5h8Drc8Nt7tKIbPRq/9AoHvN7/uGznahvzw=;
        b=h8suxQn4OUxYLQCebXiGEeQjr4PsKw/uhXvDLpOFs7SOvBfQrk+1Zf0iBrEMVtR6sz
         5bkdU1nwQBMx4JrJ577vwLFgbbLgAgAvAlFPtghdBa1bwtbaKTZUIPXq1glVCNsG7ufH
         IEBFqy1PCPdCybcNZYOuRLlCmGdDS6RblWcjWEBzDR92NtndkROGoEwzpJU7E8pNdG/g
         SMu/SfzL3AFNs5OG3ebUj69l27ssnbx1KuKhH/eb4LwZAzmxxYsA6UHzhsSSGqnWcDrc
         EcHOIUEYv7bO96qmCgxbewWQLz1RuYxIsE2F1j1yx3WNOz0xqa9H21G2hkMRCrx2CybI
         me3g==
X-Forwarded-Encrypted: i=1; AJvYcCVjb0EFSnZoKOsKWfS6TuX4+H9nUwtF1KOpRzj1LmA3SmjdDWC5oN/rAGZzLomyefbXLpqZF6iNN2W83qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAUzNrJfq2fW7lpu731Y1fsoLFu4361Np4de0I45wmCdJbASw
	flJWtqtKjlQsR/uC7LzmVKh+OCQzftAC/duhjm5kHsMKvaOCwj6eZFaoA3QY0/9yH+E=
X-Gm-Gg: ASbGncsi2WHQTJKol/oyXaE7+waFIs4dZBzTGNDoSutlobCl5j+GJ0/0PszlgzF9FmX
	dkJxF29byImir/gPPKoRCupkztEa+OFY4kQOKN3U9okbq2EDZiXI+SV/XdzNIsOqa8E325i30Ka
	xwEHyKmWdJjd8GNX3W+2Nn/cJHYghWWE7D90Glo3calpNILPZSD3U51HFdhM7E2Ff0n6qUA7dQN
	MuxYzC9lrcxw9RKpLUc6FZ/KlhqiZWNZuhCqZa/WiDS0C3lAM+oTUcIYTbcSOx+P8uXpFC9ZnoC
	nE0A1q958tNgvoL9+8NZiLqhFHCXGNPcdAPrNfmg06d8JjCrv9YaWenn
X-Google-Smtp-Source: AGHT+IEmGq9wC4IQyLXB/TI9ZBsdGOL1XrGst4jvvbDoMa+hOQOa6a8Un5NCGlbezKOm0wqBtdPwIg==
X-Received: by 2002:a05:6000:1883:b0:3a0:7af3:843f with SMTP id ffacd0b85a97d-3a35c82206fmr22440471f8f.19.1747909090632;
        Thu, 22 May 2025 03:18:10 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35e49262fsm21980253f8f.44.2025.05.22.03.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:18:10 -0700 (PDT)
Message-ID: <99508388-70cc-4121-b6d7-27f83c77a0b2@suse.com>
Date: Thu, 22 May 2025 13:18:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] x86/retbleed: Simplify the =stuff checks
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/25 05:44, Pawan Gupta wrote:
> Simplify the nested checks, remove redundant print and comment.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
