Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79289245014
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702750; cv=none; b=sNXnhmzCXagk0+0G7YOrFc2fB4jSc7o5SsJRs2PiOylveXnlLRDeVktWQVp8rZgV94CELYgnNWQCkWHT2UKZDdC7Sqlf/r0Vsiay/b7agM/CQSicyJ48mPZA//fQo3cNjIDs+ricGYZT9cAbjrFwcbmZr9tTrsZBYa/wfnUqU2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702750; c=relaxed/simple;
	bh=coA5grQd3y/jbhzcHeYZ+ZELLUFIBztOc/cGelyrWGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnetZlTh2p/cqzlucmsiybmHRNni2exRLVMYuTBnxweK0Ue4V6GVeofKURLkV72IGnCTyFGkfRymp2dWOYx7lTfkWlI6DxVBOSBcXqT0z7fDybjhFYBSRJZWgC0iPQpk8Rh3PVHcbOI6yYZSMyNHZagJZ1o0JMZT6emA3XNnRp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1FxBRCg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1FxBRCg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2260c91576aso43866295ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702747; x=1745307547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMVqxq4kdB7NkpAdRlpNvoRHAP7rIXsRI0v6UU1I0eg=;
        b=g1FxBRCgqIYkEZToU/fBsZXyjiTvjFtxCa6X/SsPMF5Zu82At0HSbXMZVdOxyIgcFM
         rYVhtlS3js4PCzWYRVTRcPc5nWvpSd3Ncz8q6pTyVgSyQF16MXJkkaNdBod4FR0Xo6Q5
         s+Z4/zkIe1G+jDuK5gi/YzKVPxBvBT6+fhrpc3Um+S2Is/U+fMyq/MixfPSLkThCSRu1
         JRo81pfPYGA0Tg/nf9Uoy4YMbsmEHSvDchfrbPRVOyRmfWLoqz8ENPBjKgXbLrR/XxdX
         B5frW+poLxDox+NXgg+EzwFFHiGFEeKPSpxPyrs3Na5/wJyujCoVU8WCSLDLclaEk0eB
         Eb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702747; x=1745307547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMVqxq4kdB7NkpAdRlpNvoRHAP7rIXsRI0v6UU1I0eg=;
        b=TGD1d2JHLTE3I6kkGJsoG38G4b1Mw7ftURwPcMfOMwgwQYozeQ51vqoRw65R2FUXJx
         yCfi+f4u0jIYUZ65lMA42BSLJ6oO/Fydj5EJqqUBW3nrdcfIpOZNMZMjSnOPRUWjMZiS
         xD/ZCpl0TaIzQKWEZ7gcn/o1UVb1nxB9sZLDL20C8C4uVYHPV/AHwnyHQbmlIpXJzbbb
         ARXjxdxvb3wJLJVGe8ysxWLwBOVzI9Q0MCo7Nrz+rp6Us2T+CZFZn55pjxoAgCJmqnn7
         NBblm8vwSq7ZRvzQnjKjZ1ZO+LkpYNyGKKbLJUa+OvcS8C/nGsTRR7q6WP0XrD6HkLiO
         qmlw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Dh8mXyhheiRu+uWrQ1HVLu3LdDOh9GSwsDrs3V22+PqAm5UEhQIDgtWA57ms2Vbf8NA6eeXE1FCp1eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqNqkTTCOgyoe5h5IPfqbK4turrRVEBLhUO2YLnfP/v9mh+Vw
	xViDN41WYF2oXFmIhGvgPKqrpCSrpvG6GPgGaRCpraAPe60HqpNCyd/x6B8XGQ==
X-Gm-Gg: ASbGncu+kdP1FFdSYp/zQrBc5gnkpziq7jWd6f8wQZ2U0ApitsI04PdFWXpXBO9Y+yG
	N2updUiNK/5VEMv2FTeWJftS4b3y8t9ADS6pLe27Jf2DbJFPP8Pcgo8YqlnIbficAv37qnSK5R2
	7RISmcVc3jT0Vom1XidYEKAtHOsq5losEc/9p76tDB6iDLM4si6Rnx+CyttSWsNwhOc2YfNq7Xh
	NqAWhshjHnPFy5gmUOTl60BQ1rE0doGJ/YW8VyI+VCKho9tnv1HNR0iDFoBQe1W3ioBF4GnjBkP
	N/+GlnQHgfseCJ9rTm6PSFZmQanLyHD5NB8VIr313m4fvRGqhA==
X-Google-Smtp-Source: AGHT+IEHpiLa1qxpwWSUDM89uSChUDBqXG6QHK/dkH6ohvACOVduUY35hpQk6VZSxSq6hdZmbeAjVA==
X-Received: by 2002:a17:902:c952:b0:224:912:153 with SMTP id d9443c01a7336-22bea49590cmr237075775ad.5.1744702746719;
        Tue, 15 Apr 2025 00:39:06 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b18esm111163075ad.82.2025.04.15.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:39:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:09:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_ramkri@quicinc.com, quic_vpernami@quicinc.com
Subject: Re: [PATCH] PCI: qcom: Implement shutdown() callback
Message-ID: <tb6kkyfgpemzacfwbg45otgcrg5ltj323y6ufjy3bw3rgri7uf@vrmmtueyg7su>
References: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>

On Tue, Apr 01, 2025 at 04:51:37PM +0530, Krishna Chaitanya Chundru wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> PCIe host controller drivers are supposed to properly remove the
> endpoint drivers and release the resources during host shutdown/reboot
> to avoid issues like smmu errors, NOC errors, etc.
> 
> So, stop and remove the root bus and its associated devices and release
> its resources during system shutdown to ensure a clean shutdown/reboot.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

While reposting a patch, you should include what has changed in-between in the
changelog. Even if there are no changes, you should mention that and express
your intent to get this patch merged.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
