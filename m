Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD516419
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331973; cv=none; b=DnxnsYQy1VNqDfO84lxx1BX7RKZqZtN0kh+6MtFQ92KMKZGsD+nvBjKSwV4Gt63GVPghnmfQEG2hvM4KgcKRwwv0E4jvAcB1YRtO+53dQfOZgQ9PKrRt2oauVSrwyWTO/fYsbMaM70ZRYzxVuE3ksKyK/8WgIpUNgue/W2ajylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331973; c=relaxed/simple;
	bh=e9D0qS5c9xuGHL/ortzIXle6NYY2SiyUiI7O3e/dBck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ew8+4WgAxDsr48kCsmve2YuN4QzhnLC+lzRxZ6D/ZVEyVp36aQbE/1Xenc/itCcgaiJXE8Aal8/T0FlydDsq0D5prXyvGPiYSr1dYktC/aZMazIuwzEKel/+klegRxQjH2sTwa2fspyhRQa2cDz6r9NHFfTFqwJfV2KpwyRsI58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2254e0b4b79so19902545ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331971; x=1744936771;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9D0qS5c9xuGHL/ortzIXle6NYY2SiyUiI7O3e/dBck=;
        b=DeJCkvW+e4Y54azsE6XLHeWb3/qJc8yXcBGmJO0Z3GvtF3Yc6S+rDktBfI7VSlIBMF
         AmPZ4qBUK9eHIJDjDI7cnYquP7ttymn2u4nfFg0IsN4/XcTyScy+rJlFxyLm/KTHEU5f
         VSPS6FzyUfhzHgL5NXfsIdcpBg1iEkk5A2+xtoAZH0Nacj89YtDps2nIYi0gK/cn+PNW
         loiFYr4oaVBn+gQ0faCa6RuO468yj6UrAEs7UVfy7LtVSNSRWjr4pdLFVCy20lcsKmo+
         uXpYJ9Ybj6JykoHgEU6eMTpYjR8wJI2bDpTg5wdoEHaPcVWWQtvijKabBUVMtRicfBDH
         vIQA==
X-Forwarded-Encrypted: i=1; AJvYcCXE0yhvRFIbxpoId3a6Y/yV114EvhQ+V9JzMxNz5UuzOTiXpV+K15Yjqa66+WD4UDxvfYmY6t6f5G6WqbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+S9s91XXf8kWS2HFwfGNjQ+LK1+X0xSWE0tewtmXOWNYtZdBO
	6L8TLup2mnS2Hf10UH9wBhnHQvX4OOonAu6i0PNuuCQblXmkUWVxFpmSz36Am1I=
X-Gm-Gg: ASbGncuhWHlQ30wLVGUVGHSAfQiITF2HOR409o2Ps7HRduEFQ2QR083o2mD0vVQ+ucA
	1yllE3rs/HmoMfZn2LY+9qMu+0iHZXbaPATKN5zssnYAaTLCFPotN5Py3RWnmcfqdYupQ+5FHqs
	zR2SyK0JJ10miM+12KybElp0xSD4xsQAWQsoy/1hrGNFl5k4vf0n/ku58XSBsdspWlZa64PzRsF
	7S6E5oTjK5vU5xKyKDyFPEhFDbrYmtFfNgb6zma7UPpKMYu6dA/jkE3OVyX2dDZfCfzWWq9orkk
	vsCGkJHzRnfmu7u4M6GAVY106nCDVwV+rFQMfCTN44atZtW15A==
X-Google-Smtp-Source: AGHT+IHE46ZClxLKC9hdNZdcLjjMQRYqIyIdTcUA0yqBYfKQO0vYwM2JBDfdFcSq7VTlGW9xIaW8WA==
X-Received: by 2002:a17:902:ccc5:b0:224:376:7a21 with SMTP id d9443c01a7336-22bea4fde7cmr10776535ad.42.1744331971575;
        Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5c5sm37254655ad.222.2025.04.10.17.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: David Heidelberg <david@ixit.cz>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Pali
 =?utf-8?Q?Roh=C3=A1r?=
 <pali@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
In-Reply-To: <20250213203208.93316-1-david@ixit.cz>
References: <20250213203208.93316-1-david@ixit.cz>
Date: Thu, 10 Apr 2025 17:39:30 -0700
Message-ID: <7htt6vwmyl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David Heidelberg <david@ixit.cz> writes:

> This property is irrelevant for the ad5820 DAC,
> the driver nor the hardware indicate use of channel cells.
>
> Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera support")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Queued for v6.16,

Thanks,

Kevin
