Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26692580C4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199530; cv=none; b=OuRnrUUrtW8ImQpbut+yuts2+3Xc3+gXiceeOvZQaMiuGVEOgZuRDVq68S/mo85T2UbKB8sZ9IQ4163hA6q1oLP5XFN3Kc3KHBUHi0LN7JGr/R8giMGrAUSK+8+Ww2erA85IrTxTZt7/ex9G18qygpvtv/oRaRBTpn8FGgPbfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199530; c=relaxed/simple;
	bh=LugdRThvsGx2CMHigSiJVuGvIK3aWNwVUx/pou6IRSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aakley6N3AREpJa34g6CWe09KfkuQS0Ugk8NzGfmEWV4XlitLY4GV8DmeaYX16ghKIgjO7HrM4jgwxWWL+mX+F9KGWYCrPM95YKh4xw9IuWcKJkSaU8v/coaixv97t7neHi9pqAYTV9Sp+UsH23pt4SRMEH5/QMo247TaBAE7vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yFPN4O74; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFPN4O74"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so37774705ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746199527; x=1746804327; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7vtwnUwNKasAWxl8DSVgxrM1mcYEXj9Ayz7aojcassc=;
        b=yFPN4O74yAhN2NDeW+wVC9rYdR4lG9CLBBiX5oNVpHeJEt5P22eLhLW+Gfg5Pbbqte
         OAkFhN6gmXl6HqsgtO2aPsZUnSNjSVOAxNOZEBRD+GFOv1X81tzljNv3IbiyC/IAJm/V
         IvESQwPQDF6IRvT3dZZRp4Beo2kuHRwOkjSdSiyJ55YfDyVbE/Wnlq9wCzJRa+GqD//M
         H4XZMAEC1DANj+17xJrdk4iglrvnKCWAV5g5oUL8U/sPKFZR32kgMe5EWWXEJByG13em
         13uUjOY1G4by4U9zBF05Q8lhwpGRKr5lE3LFz11o8NpFWS/hxjEuhS2RsHvaMHygRxZA
         b6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199527; x=1746804327;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vtwnUwNKasAWxl8DSVgxrM1mcYEXj9Ayz7aojcassc=;
        b=G3Vfmpcb4hL7iBlHatP5P0LyJv9+BZ580noIFwlWxKTaEtEubPUfLHMGqYH93io53H
         RrGr24bEjJNPxiV6rzni9DR5OZLi26qxlx9QZTVKyIFHRBNsH0BKce6Fk3vZ849FLoDD
         mwMPAj0+zEnUYD6elCkcWCbQ4hmgRyzBUJnzocUbl2GQMBA1Hg+Q9HAFlFjFTP+LrRGs
         TUUDH1FxyKco06XZVCjXT7SrrinIR8oz1vGArZf31JU7Zxq6MpC5SsrVMH+tFiSWtoF+
         53BCDlEXPGvV+nryRZaDSBOOra/35e3xdGU5D4tkyjzhZfpA0iXDfnUlQqwD1guWAF24
         nOyg==
X-Forwarded-Encrypted: i=1; AJvYcCWVMqzbURiOx3iPwPsmVipmbcTgIgRTxk542Nv7F7Yw+Ou5vrT/rijZkGU4iBdNXBerV5zA3M1jieYiFnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVm+EYipGSIC2WnRAGOKovXT/ASD/TmLLTzhuq+An6oOtSQ2I
	5to/GoAwJx1udUmjwS1RDmdfunZUG9CY2MUnXKi1O6KUJg1XpIRIX9hyxI9EoA==
X-Gm-Gg: ASbGncvC2y8MFZK0WDms/FYQq+8nnOI8ywHGLW+zrfFDjNWbb0cyaq1V7jvXH6OhZon
	h+zJe/hSKwWUhozJ8852A1M2KmKYlUWmHT8cCLWiithSsUzjp73zfO9SqnblMFBaKCfAjGMwIPI
	dscpGxEsiBSthUYJf/QpJe9mPE1HvGsvwp//v/XNpASst/SohwM/WKm2xtKefHAHrIMBHj2AplB
	JbFqzCWCyZ+civZ9Wmjh3Kazzg8JfKqZrXo0jz4EHlD25+p8aiOollxPu+NxSEbJDHvn3GBvUwc
	AV71DHE9gMxEBZrsr/ZPU2qOxBbdPkEmAgcW/wNS1+GDD8wsBDwgFg==
X-Google-Smtp-Source: AGHT+IHRKIqAtv7Ls6TzIfJYzOfALtMKzptW9t6NwjhMvUbrkIGXkQiOlsae6Xx1+FVT8dizOUKPfA==
X-Received: by 2002:a17:902:e54a:b0:224:910:23f0 with SMTP id d9443c01a7336-22e103dd51fmr51268655ad.49.1746199526887;
        Fri, 02 May 2025 08:25:26 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1523205asm8677055ad.241.2025.05.02.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:25:26 -0700 (PDT)
Date: Fri, 2 May 2025 20:55:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sai Krishna Musham <sai.krishna.musham@amd.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, cassel@kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, bharat.kumar.gogada@amd.com, thippeswamy.havalige@amd.com
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: amd-mdb: Add `reset-gpios`
 property to example device tree
Message-ID: <ph5rby7y3jnu4fnbhiojesu6dsnre63vc4hmsjyasajrvurj6g@g6eo7lvjtuax>
References: <20250429090046.1512000-1-sai.krishna.musham@amd.com>
 <20250429090046.1512000-2-sai.krishna.musham@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429090046.1512000-2-sai.krishna.musham@amd.com>

On Tue, Apr 29, 2025 at 02:30:45PM +0530, Sai Krishna Musham wrote:
> Add `reset-gpios` property to the example device tree node for
> GPIO-based handling of the PCIe Root Port (RP) PERST# signal.
> 
> Signed-off-by: Sai Krishna Musham <sai.krishna.musham@amd.com>
> ---
> Changes in v2:
> - Update commit message
> ---
>  Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml b/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> index 43dc2585c237..e6117d326279 100644
> --- a/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> @@ -87,6 +87,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
>  
>      soc {
>          #address-cells = <2>;
> @@ -112,6 +113,7 @@ examples:
>              #size-cells = <2>;
>              #interrupt-cells = <1>;
>              device_type = "pci";
> +            reset-gpios = <&tca6416_u37 7 GPIO_ACTIVE_LOW>;

You should move this property to the PCI bridge node where it belongs to. We
identified this issue of stuffing bridge specific properties to the controller
node recently (yeah very late though), but since this controller doesn't have
any bridge specific properties till now, I'd like it to do the right thing.

So please refer the STM32 sereies on how to do it [1][2]. On the driver side,
you specifically need to implement an equivalent of stm32_pcie_parse_port() in
that patch that parses the bridge node(s) for these properties.

- Mani

[1] https://lore.kernel.org/linux-pci/20250423090119.4003700-2-christian.bruel@foss.st.com/
[2] https://lore.kernel.org/linux-pci/20250423090119.4003700-3-christian.bruel@foss.st.com/

-- 
மணிவண்ணன் சதாசிவம்
