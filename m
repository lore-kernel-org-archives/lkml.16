Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671E17A30F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343433; cv=none; b=oF7k7JuImv79I29CZGaS9iFB3VEoYud7YLLx18uH3IPRLmBFW5IaJprA7R7NgTndD1eVtS/Xx7upueRtUcxoBosHbI6sIEp5ANLYiQOJ9zjBFb4loke4FFJjM7X3LsFoD8BpT7MPfWpx1MngBOFPXlMHFcWIE2zotmNER9w/Z24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343433; c=relaxed/simple;
	bh=g8haI9LrZzRAwDNpd97grl20AHL8yhseMMTWdWFnOIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4Z61qFVijL14oTHubzXyNCfoM7apyuU72cISrw4Wzuy6z7v0FSaul+9OVDAR791UlG6hkzHFixB+lsdQ3t5nJjAvDtMr7boHB4uQBFkCwGk26UHz3xJkkJsJFe/kurwhykDIlN/FtQX+/I8bVt8FSF9dS4zaTg09yIUYVP7EDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1YBwJqW; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1YBwJqW"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6114114daddso386250eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343431; x=1750948231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qy42reb/xe10l3RYfDyIyYy8nirQQxhtcbahwdHka8=;
        b=t1YBwJqWO2fhfQFqxtYxzcysoqOIuPzwx5ukimTkmL7N9zENC7Sv1oYi7FCk7nesgi
         gyj8aDmhIHW+6wpD0fRB8O+adtpZOPmAxij+ssjP8sMP0rQy7kZOo7+n/lTcUr/CGjR8
         rlIk+MA6fF2PqME2E4LKZubTkTkJTKJhawtblShVescLRCL1eTw0bmb+rKvdFbrGzBfp
         eA3kv/WSOtdffI7NbvrtrVmdCHE1vGOUuSyeBAFLJGU6s2YSFlArFqszeUH3BB7+Qr0o
         ibfRt0nJ23Z7CnDnQ1CgRJGOciShxo/jQK2Pyr++CPY36JK5Is+KuwQXDEM637WTOEbW
         ebQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343431; x=1750948231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qy42reb/xe10l3RYfDyIyYy8nirQQxhtcbahwdHka8=;
        b=X91L1m3vPTKZvscv5Z/XERuEFI5HlXXgVGd7e3fq/fI37Hz3BdJXZt/G6JdfT5tum9
         XoSmY9BcWptUYShhmR2G815qAveSCKS9U+H+5RoA1BatikwpYcau+K2l71cGFFln2XI2
         q5GtwgYTUbzvTHFuv9eKMgfrEWXqAsqhT4h1OiN5mplKPXaE0wwrQoJO+7rStDwdljDU
         we25n+diLTkQDrAZWWO+USXPdlqRemv+C8V2+1BniUfwTumI6CVQGh/yssrOH3lFNmGo
         Z/PRvoektyZ6DBes26RxkKyPzE6exIMOPgpyOtOjN0Ls1y6hzUutlZ8n/wmYPc7UIH3p
         /o6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2BAv9K5RQBC3Q8FMhcXppStG7lhSWTqZ2aWZdglZO8InPmyrxQoAf5XIvMSmW/fBBnZNQsvEKMopxx8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BsnNOt9gcGytmmP5g+ebJQVVRD2Z2KoGCY+nXwhROd/0rNZ4
	ydPTGiFQF/sB2Dg1UUyFkjB23msiUM6xaFszpEBWlI8cJpj9tqFTnPSMGxxhAU92qv+0v9/mdu9
	OP0su
X-Gm-Gg: ASbGncsmnuJHXchBznqh4ewDaWU0JtRvjH4BrvUmElUscof56gzF82xkYG5+hkgVLmH
	KgKiB6UtSYEN838yd/hN/SAva4OqSODsZ6Eokow1oPFVGC8lD//3G/yeYe9r264B8Zy3Z8jYjMv
	r/GBvKOoWO97s1Sf9yDr1jP7AslQLXiyaOlXU7qVFPmXY8HdGq3UofcdtpmuRAwg8hybc3EckCT
	VmCUqx5zDwsAd1Kl+AnxXLB4CnBApJZ/oDqawb7EvwE62+ioS6WBUJ26n2Cz1y6qGHTpeFYbH/9
	NBgVHtm0FKieQrADoTVaSc32d3qVdeMc40aI9/Ubtmwj1bbyazmTSEFPuevMH5V4w8xn/Q==
X-Google-Smtp-Source: AGHT+IG56YN7u7s5Aa17918jH2u+v02dZCDW3BGdDf6jjau6fXqkE6EwtY5ebKvrV1h8cThc6YLJAQ==
X-Received: by 2002:a05:6820:4ded:b0:611:471b:6439 with SMTP id 006d021491bc7-611471b6a5cmr4269454eaf.3.1750343430854;
        Thu, 19 Jun 2025 07:30:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108ebd0e5sm1684222eaf.23.2025.06.19.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:30:29 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:30:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: rafael@kernel.org, bhelgaas@google.com, helgaas@kernel.org,
	lenb@kernel.org, kwilczynski@kernel.org, sashal@kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "PCI/ACPI: Fix allocated memory release on error
 in pci_acpi_scan_root()"
Message-ID: <87a513bd-096c-45ab-8f5f-a8d3d6ad6b2e@suswa.mountain>
References: <20250619072608.2075475-1-qiaozhe@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619072608.2075475-1-qiaozhe@iscas.ac.cn>

On Thu, Jun 19, 2025 at 03:26:08PM +0800, Zhe Qiao wrote:
> This reverts commit 631b2af2f35737750af284be22e63da56bf20139.
> 
> The reverted patch causes the 'ri->cfg' and 'root_ops' resources to be
> released multiple times.
> 
> When acpi_pci_root_create() fails, these resources have already been
> released internally by the __acpi_pci_root_release_info() function.
> Releasing them again in pci_acpi_scan_root() leads to incorrect behavior
> and potential memory issues.
> 
> We plan to resolve the issue using a more appropriate fix.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aEmdnuw715btq7Q5@stanley.mountain/
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

Reverting is probably the simplest option.  There is still an issue in
the code where in acpi_pci_root_create() the goto out_release_info
doesn't free sysdata except on the last goto.  So there is a small
leak.  But it's probably more theoretical than real.

regards,
dan carpenter

