Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE0127E051
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410086; cv=none; b=sX3PmC+TRevImNj9IU9MEY7zotUXjXVw9SebqGt7GNNGePgjy+OANAmn+j+FBWmPuMDvauttnOnoD1Qm7rV8lKedQkQW4y+LPmH9/6DPZMoF8YVl43sRN12ALt7DBtDa3AyvfJLdNle2uOxBWg6mOVz9xhP5FR5tqkwZePUFXP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410086; c=relaxed/simple;
	bh=YrP2gC6yzF7+01sD+adEWpkCL/eUCTLHQ55D7CZnBEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CEq4xotKPMBdxszvxVOCvI0dz+pwdfVX3Qg6Dais63hd/+Z226lhcxSWpA5udKCVdrRvXug0LUiwvrzfCBPyGRU4DEv+k53FvCSAHjOz6EfcMeFDg8bUi0KaRYIG7QCEcfXO42ujq+vHIHvbaJU1SH02dGecP4EPMzJpoykGweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LGsGSgIV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LGsGSgIV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae04ce9153aso207807466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750410082; x=1751014882; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSgGeI6RPkNX/6Nx7o+CdwyAntQHm7sGCCxVWOem2w8=;
        b=LGsGSgIV1QOsEbm4P8phGCqfn54CXCS2MA4qCKXCKvy1D+ysntkeA6eUfd6A/5Ub0J
         SiS5GSq1elwhdOwPPSRAF3l74NdM2iq/v7t5LfHzhP6SoZGQ8QgcGTwPF84dCmeqCoVh
         arvmepCP86SAv3phx/hBcXy9RFKLBqRRGU8MKAKjIXlUljB+UO/riQ+7H1xOLMItb4/f
         VDdgI/qCaVpKvVKlhQav5bscnPapHoX+LMfLG4yddlLknU1YY4sOswuZbgDmRmNROqi5
         ZYMvN6XvaZakG5yNZt8q7f2chKhrp4LENsWJcj56Evi0nj3vIJmBQlO6tQkoiYNKn0ro
         MM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410082; x=1751014882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSgGeI6RPkNX/6Nx7o+CdwyAntQHm7sGCCxVWOem2w8=;
        b=j3eDaUOOlyr6ih97MXVTN8+KIgAbYadeSDXdDyfymznMCzrxNsuxP1JeFAvUHnT3NS
         g8MAkwoGlNfucvuEtyIs7tJ7bMRY3j+YWswid4GQ4f3ipju2T2rIlQZGqMaLmPMAXHxE
         Gb0SZ/WDtlhiFqFqggVHUPv8Wqql52Uk7IaEQ1HdsyzSOl0444Q2MmIqKU3FkfbkH0iy
         0eO7VmUMFH45VlOjakvrDGHncX69fPwtnA1zPwxZdfFfL06rVt/meWd7Y1RXud/YA2hd
         hYXu0yuMTXqlJnEuM7hTZy6xIWXrPI8YdVb9S5PPR0Q3n+PyCNoRlLuBdDm6k5tRzMvy
         WbUw==
X-Forwarded-Encrypted: i=1; AJvYcCWnb+jFDmX9N1J5VhDclxqJjZdcOTQR75EI4RwP/PzsUbVJDokZMuXeAVhQZfd8K7XDSKu6F6Uw2UCHZBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqqZwHTxeSqWgEI31A+L6qI77RX7MKBWmlWfHu11KGz5LRWktV
	hmiSL9oN5C6llMgQOmqsd3nMfRiBJBUUS2YxbUMq5oOCyAMvpOd5ixqluvej7oWshZ4=
X-Gm-Gg: ASbGncuggY+HkNL7haDy28PoLkzMcn0MwZF1mDSTb8Kdkp/yVwmiFfnuh9EQXdsX9bs
	ex48XsRn/cTyjGLCYIIiTzLgGCkdYVPuI07YTN1g0Pl+UUz+OH8gf34lBvhGVFJLqvAD89PY6Vj
	eqOQShGkCd5Sbi9477WGGrchSWT2dgvs5G6mA+S6GJWY1+oB9bpxZu+TCYBHW19YfNBGYJepOKS
	l7Nz1vNdsMB7lEOegMKjPZK9u5xn1J3Kvt960nw7XPCakCQeoi7s0DEZjrDDt9O4xzTmMmtyyUY
	ODCdOYguP7CkPBNr9lusDrDWt3UBiC2FEqX/kn2+/AXc6LkoHxL/nCBDn60DlApLTBNu0pixjl3
	LJgUeZuER2x1G8Qy5sastOuITkIG+615l71/ZQFBXGA==
X-Google-Smtp-Source: AGHT+IEhyS+3Hkk2TlhfDWZUPUo2xBTpBDeJOyfp0vYr2FDqO4tGaGom5OMtaz2UPfLrKxD1kEZb1Q==
X-Received: by 2002:a17:907:3d16:b0:ad8:959c:c567 with SMTP id a640c23a62f3a-ae05ae211a0mr151097266b.10.1750410082254;
        Fri, 20 Jun 2025 02:01:22 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408300dsm129887466b.95.2025.06.20.02.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 11:01:21 +0200
Message-Id: <DAR8L6C8LIOH.A6EGWUZJ2NN4@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Introduce support for the SMB5 charger found on pm8150b and other more
> modern Qualcomm SoCs.
>
> SMB5 is largely similar to SMB2, with a few register differences. The
> main difference is the new Type-C hardware block which some registers
> are moved to.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

<snip>

> +static int smb_get_prop_health(struct smb_chip *chip, int *val)
> +{
> +	switch (chip->gen) {
> +	case SMB2:
> +		return smb2_get_prop_health(chip, val);
> +	case SMB5:
> +		return smb5_get_prop_health(chip, val);
> +	}
> +}

This doesn't compile for me:

drivers/power/supply/qcom_smbx.c: In function 'smb_get_prop_health':
drivers/power/supply/qcom_smbx.c:588:1: error: control reaches end of non-v=
oid function [-Werror=3Dreturn-type]
  588 | }
      | ^

Regards
Luca
