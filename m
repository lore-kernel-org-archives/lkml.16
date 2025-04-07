Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2F92080C9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041899; cv=none; b=CCuJDkNXbBEng1hX3TACsyXCvShyswyH9vEhKhEHhDl8S/jgo5u0d+NA/6qcjCF3oDqglaHOY2fJBHpnxexLZ21LaDwIP0ORzthcOoRQ/zZEPSXClPclF+BTNx2u9k4kjiuoNiCDk8TDof+lC16ttDZAfdiUJstqTqpfsgeqN6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041899; c=relaxed/simple;
	bh=EsyAkb+E/Vx2Pf5QNAmePM6Wum91PuEAZobvU/Trbwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf9lgJsiP3OW5FOLJmyx4V+SGI9YK51Aa28i2DJ/hDg/lAtJqmtMgeMbny8rr+kknshYO9GmjHqFz08RNltLq749KErV3N1P2jJnZWWLx9s+N9GBiFPLlkw4mf0/FiDumN9w6hdUEhw/aXzhsOUYgG8gHqkVM+PJgYlWm207Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcS6x+aT; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcS6x+aT"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ff2adbba3fso41943977b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041896; x=1744646696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRtsR6xVM6ZICvsMHRTNEQJgU7qZB7aRP4KnHCrPc+w=;
        b=kcS6x+aTkHj/AVvOgI2CTNrRZAoECZtH0huKHm5sGQYXCgKKbHgKJUu7xUdHmJsPXw
         kqnncFElGFcyq7YSWVENNY3waCz7ZLqPwziALeSa5vNgSVfN+D3N3fqS0Ym4ITVgZQcn
         I4MyRy2MiE06UqJFk7hSQ/Z8V1mxx6wJHRN/8/Gny0rETsUQ5ju9Xb04FNZOQe0Lcu5E
         hGHeGQHDWhh5ayhTIEfSvWnwYscPFOTi4d7VofxvjxKieaEYQcxxoxsi1umVqaVw0oWk
         VLDmLgF6ocM3s5Jxy+25dvnD53ZvYBxSOAMkD8JJrEPDQEiDyJ/RtoGQ22A2MdBSxL4W
         69AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041896; x=1744646696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRtsR6xVM6ZICvsMHRTNEQJgU7qZB7aRP4KnHCrPc+w=;
        b=o6RIchFLHP+My9ZWiBKXihR3DtrHRwwJHVCdS2PGR+TP/QNGvolXg80i2/q16hjakd
         3PvYRcfwJSxuz1W7j2KwqdNKR5iGUjtpmU8KQnuDWJaNKUpkLdglfVdafKRLRd500g5q
         tD6BRyWbKB1QGB5q6Fn7v50RaiQsXwBpmKp2POauZ2Vxp9IqyHFNEdNWSpO6ie6wrN6J
         YxJCN5AxtGMV1q5laFL9m87upsVo6RrtXeOqY4M9RWVHVBLNsA7BhvcQDuiS/kYKTbJx
         vABRdcxsiUlHTlmwgqyRTe+ZiUvx5Yf9xNid7j9wah3WWEuwwhqrNUG8dYaTnip2gpxO
         tzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBABbwpYszew/g/V7GCznHhPS3mo1LRh9mvzMIBRHXOUtvkSHvULfNaKnnJ8L/7IpUyBEqwL2yP0V1f9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ0UPt5HoWPOBZbQmrmJtAXqwHJHju7CIxIis0dLwlhZDOpgM7
	SryEHDbAtkyDg3SOrHG+vi2tocWnMyPi++EK5gOQQdAUim9T1PmYYH+oiZtoEaQmfiIeBx03vkF
	zZHIDWeMRPKzWOx//acGMBlIwkL1CKcaXitoprA==
X-Gm-Gg: ASbGncuV5zZOFe+n+lJaENONZL5FSHZ9dzu/VZ0EXw18yoC20uwwADLDHmMjHfLTSVa
	bkt+V73XGwnCcm/+jY8nv5yq7USXXdaA03/nos12cWYWUxLTCCmCAD+WEJvv+36YMXDFceWqedt
	MgLU2dB1i3EGXGRzMv0V2v1pywzeI=
X-Google-Smtp-Source: AGHT+IEgtyhHcw5Jpgfae/63h0KNZCvI+qxXPeZypusFjvmWFk+cO1XtdFw/5d+hW1tCksobHOcrVkCj/XZ7Ug4xyF0=
X-Received: by 2002:a05:690c:3686:b0:703:ac44:d37e with SMTP id
 00721157ae682-703f42fc111mr168754697b3.37.1744041896281; Mon, 07 Apr 2025
 09:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320211922.1135669-1-robh@kernel.org>
In-Reply-To: <20250320211922.1135669-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:19 +0200
X-Gm-Features: ATxdqUH-tbXCaf4ePanPkHh6DiK3ftNM3BoL1J4Avf3yLjwSBSY2qumPHOTnSI8
Message-ID: <CAPDyKFpzxK3AaEPsWjkgmPCjCO6u8NeWdZiStWst_Uzdda9MBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: Remove redundant sdhci.txt
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Mar 2025 at 22:19, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The properties in sdhci.txt are documented in sdhci-common.yaml, too.
> Remove the txt binding.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci.txt | 13 -------------
>  1 file changed, 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci.txt
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci.txt b/Documentation/devicetree/bindings/mmc/sdhci.txt
> deleted file mode 100644
> index 0e9923a64024..000000000000
> --- a/Documentation/devicetree/bindings/mmc/sdhci.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -The properties specific for SD host controllers. For properties shared by MMC
> -host controllers refer to the mmc[1] bindings.
> -
> -  [1] Documentation/devicetree/bindings/mmc/mmc.txt
> -
> -Optional properties:
> -- sdhci-caps-mask: The sdhci capabilities register is incorrect. This 64bit
> -  property corresponds to the bits in the sdhci capability register. If the bit
> -  is on in the mask then the bit is incorrect in the register and should be
> -  turned off, before applying sdhci-caps.
> -- sdhci-caps: The sdhci capabilities register is incorrect. This 64bit
> -  property corresponds to the bits in the sdhci capability register. If the
> -  bit is on in the property then the bit should be turned on.
> --
> 2.47.2
>
