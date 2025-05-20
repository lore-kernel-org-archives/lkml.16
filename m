Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC41A2C11
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707745; cv=none; b=sC5wLkdoxEjYFYf4aNYa8Hmb/fzxnqAZe09sp4KDcJ7Cd/9Jt/PlNxlnOAQRBq2VxQZya1+h5U01pNSl5h1cGgZJK4h+XADvPx+WIFjyZ+XPy7hNEjyh5sBVIRWxuSNs5aCNL29/rhurzDt9tdM84u4EucWcgOx2uZlM6JQWg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707745; c=relaxed/simple;
	bh=jmXrTHnVLLq/i/PxF7Fe3GkUyb8o/LpC3K9yRXSmslk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjmOlHCCRokficGcNyTT5JdXvWSJP7hSCCsRtUuSU1Ieaetjl1jEkXe8GzYZD3r3dEvUg28bKIxB4ZQGlZERAhz6PV9v2hS8IPElyOSUkPSLeQBiyDW0roZBDirRM3sLN5A9sj/1rJqoClxFyhbJAZ9D+xmZMqrVF6j0oq0p7kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=XWlhl9Pg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="XWlhl9Pg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2320e53167dso28967735ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747707743; x=1748312543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0x1pMRaRiUXRU9jlmtdQiRSbIB2PaGoK9fRSAZ7jcdo=;
        b=XWlhl9PgT15OvnVBpTll3nfdFsLod01sSLXyT8JDu4pjvsjNrSHBH8hCzVr94TgrVW
         ioNm3CXwxbEQB5HMSgaIiw67sX1Ndhuk+lojiwXUe1J6aYqf/TMdFLMK+x/efSYjMZHd
         0JMvI0E0K2S0f3aRtjiDDyZ5Su4OAPzlOpcLCCMN1CGwC0QloBsYo++pS8trchWoUbyu
         x6QI5oNJF5N/YyQ1E4Ct83BoqBKCXl1Olbts10FAZpkfWda3VRLkSd3zKbLw4ak0by78
         5dtjiYR3PGw55tij8qWpHjaPcQhlMnLKRx4Un6t1CCAD8KY/itAG8p7dGjpQGe/wDlTF
         N/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747707743; x=1748312543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x1pMRaRiUXRU9jlmtdQiRSbIB2PaGoK9fRSAZ7jcdo=;
        b=i5j7tPfXn4aXi8jL3ZaQUnTaZZKyqz9h49y87o3RI0jnWHpIXLB5TJlabxQdIMgGOc
         31x1ePvQM/7z2Bg0Jqc1bE1ZrB88DlkdqcAE0HdGzo0wRSfTME9No7HmR1mZCYSVMChe
         hCCt/Q6eD7QuPw/+NhBfjEjzYIiRRA7dF13XZXIMRBfZHpnMOQFqxJe3qrKNrxeiToNC
         RI/soMb8yaVsKekhDXm5b2+WzNoCWoWI6iHsrlz6GbLWNmeeVrQcGUQd90CUREnyw374
         +OftDLATQvPQzymLdY2XjGYq8hPcV2MY/g/8Z0/RkJjWr8ClEDv2Vntzl1LZ17xX/orB
         bjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ll6T+J7vfhCRZdyT369RRt9X3JIGv4jpeerJ7w5sCPsJAUdqFnk0bVsN+HnhqabAmTVzjDPBPczVeuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpVhf5Z4h9QEzybX8nRJ16IWBawMGrYec6JZPkoedLLMv/7ql
	8jMmkYqmN6VbZkxpbPaaZ4mpE7zZpUvjun7GRQkvolIjw94Aas6IdKfUEeHw+ljYf2g=
X-Gm-Gg: ASbGncsBuld7/+4RObzMry2Ljz7DJ3lcjwGayTNgW8zKlzg20Dn55yf0XHVO67s1B1B
	iRsRqKNul4UKh/BqmG4a3x+WjxRu75ySB8BIk/HxjuHkoZhp0z/HXG6tZ+t4kpngFhfpcMpLnVN
	WgrjsfI0Zel5mlXfeMYTdgqe8R7cnsyFguvgOoSE/TAoDPXja2ppcJCTfjGyvANY9RoeKTP0q9G
	nwHL9E+Rzvnnonm13kHNYqahDUQvBlMlzV6QIuRW5HalK+aUR5VskIHACg6LCNmIUnlN6mEZBC8
	SKKwhmQ4pn5lUp+w+1nKfmLFaM2XkPvHJm5jEmS5yDn9/idTUpW0yEt0RuUEPydGIh8kmiez+A=
	=
X-Google-Smtp-Source: AGHT+IFL505dYK5kP0RzEBvKLWhjueG80hANUDXQg8Vm6xat3akzB1GhSjsarMMmvWhb64KnIqDstg==
X-Received: by 2002:a17:903:b8f:b0:224:c76:5e57 with SMTP id d9443c01a7336-231d459bee3mr202331325ad.39.1747707743271;
        Mon, 19 May 2025 19:22:23 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb71dsm66926355ad.62.2025.05.19.19.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:22:22 -0700 (PDT)
Date: Mon, 19 May 2025 19:22:21 -0700
From: Drew Fustini <drew@pdp7.com>
To: Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pmem: Convert binding to YAML
Message-ID: <aCvnXW12cC97amX3@x1>
References: <20250520021440.24324-1-drew@pdp7.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520021440.24324-1-drew@pdp7.com>

On Mon, May 19, 2025 at 07:14:40PM -0700, Drew Fustini wrote:
> Convert the PMEM device tree binding from text to YAML. This will allow
> device trees with pmem-region nodes to pass dtbs_check.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
> v2: remove the txt file to make the conversion complete

Krzysztof/Rob: my apologies, I forgot to add v2 to the Subject. Please
let me know if I should resend.

Thank you,
Drew
