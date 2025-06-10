Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF713790B;
	Tue, 10 Jun 2025 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520226; cv=none; b=QxiSPRV4GDV11hvlbURzFU9ozEBD1W7Vl8L7HS2XvDpU3nwegUJnpl4gfiDuCKki1CD/bMCgzohyq4DQC/QmBiimwjXmJrdSUBTo7ABVSQmI7oLD1cst9qVk794HFDbp2gGpRU9ZaAojle3zQYVP03Gbfu3JZyEFtgHzMXj6/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520226; c=relaxed/simple;
	bh=LsztCVXZZPbLzW5t60Ca3HvRdV7GOesUL5uH8ho9IOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk41jz8aO7UC2cjg+t9U5v7cxv+A8O5c3Z04P0yA1Ba4GN726iG4wvMMEl0J44Vnr8H5viNbFtpseoKPUpYflIgL/Kgujsy3U2/KJgBCiQkGwCoFi41k70pH9nGN/9cCF1FG2v3D+aBfIYdFeNLBZx50CbZHsQm6HqOCXyl2obw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3BkOKNA; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3BkOKNA"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d21f21baf7so460918585a.0;
        Mon, 09 Jun 2025 18:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520223; x=1750125023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ+k4mMk424f8gSBCF0DcdgBmLjrlumxnw+t8TKS1zw=;
        b=T3BkOKNAlqQIB3a4oyVhaCzET6jM2dtZTMN8K54lQiZvWs3CAbSPFIkd3X6L2vMG44
         opVzcRNTug21Cy5hKgV3DDhUZKd/A8kGjByPglbQoGSVmkp6s5/eapryM7LsXlNDo0Br
         SCIrnYIMIAYr65MwjUvEcPuLTBLP54uthQadSIPsgjfJKHmVfD+3rNQieRx69GEfX79D
         OWvyN6ljBdhTbqu2dnJ73r6aCl2UGYAtXzWJnbZrGKjccc73fE6j7RbzNVwH/jGgV2S1
         ro6GwV7rxV7wT+QOIBObyOkxiKW0i/rrHT7tgCHqQtEQ3n4UvA0SQwqJUop5tSVgi+/s
         G31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520223; x=1750125023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ+k4mMk424f8gSBCF0DcdgBmLjrlumxnw+t8TKS1zw=;
        b=L8i+EIDJxu6SdrlCfQVVZKs2sDLaXIbLjAsJC7X5qEpd8tlsz9x9GjpSJYSZtbnZkV
         xU76DwDouDqWIXh/SNuSytoIz6TIOU8FpsvD6k8366CD1CqfKG799pEQyDRRc0NKutDu
         lQWvEZCSj32VvlsGzAnReTRknBzrIHM/90GloVeylA2ekRM03hx0Fkl9J7F0FBOy/q61
         2kNp8sULas4wBWDR6VhhRuzPsOwXkckZ/SQa/ukxvge/RMN44pcviec50jD4wrwSbKZ0
         37Hq4c6SwgmmFcAaq0hWSmvmSa5e42Uy0pJ15q7qYGPJ3UN6tvJyxBK5nYrUPOoxgjBf
         5fBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKxKOCkvZkFCzpyaYSNTvX1OmBT+RQusKK62zpRkVh0sfEHB8eLvPgMruOYDfphjkOFijkrNW4PCR9@vger.kernel.org, AJvYcCWKXPxMrVGh84v1ksDXFCECM78UA+ZfngXPnJqe6OqbgE43W0Bma6QF0vA1VwWb3CXLq8CO1p1hRpcz4pM+@vger.kernel.org
X-Gm-Message-State: AOJu0YzrNsMR+S9/puKEReLSaFoOmg0wetc+Mbs6kgap5w6EOQpxAqyp
	rjIhgcrLBXlGcWFRfdAw92LMxdam6oBHy+L68Oy3PczvM8hVe96M2u0o
X-Gm-Gg: ASbGnct61R8nmJ5YKK0FUgLiQt5CXY7m5bm/403V1E0+gE8YlwfgwgB5JVjrkLxy3zX
	kY7/72PSu7HUczjhuVSTfI7xYa+7ZiACiTc60xsR7itdIkABrWFZTHcanWl2q14U/jkKKFoliGW
	KfgoEFxpMfWv1b1W8I0cgLDfF6oHxFE5uNbyh6glGOXJCsThJx9Ekq8ejaAIH+Jc1IyGpdmCk/y
	lzFo4RiYIRAqE6Ks8fn/qN1us/aaTD1NBX+zjaC3QE7HlNlwiAp6eGvF0yESd4BpyWh1LzJu9EL
	HayGb89XnBRXc9cv2MjyhRovCzDfgiN/XpPnNA==
X-Google-Smtp-Source: AGHT+IGMgWEajIStyhq4ZxgjEnDpGh/DhsVjHF6fVJlErUi/6EmExzbw4J5ZZ8yxGUZo19XRc5vv/g==
X-Received: by 2002:a05:620a:400c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d39f62dad1mr139939085a.44.1749520223312;
        Mon, 09 Jun 2025 18:50:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a61d730sm618530785a.82.2025.06.09.18.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:50:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:49:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH 0/2] Add reset controller support for Sophgo SG2000 SoC
Message-ID: <nztbl7ki2pmgb4nrahdyam6yeu7xtlv7lgfuqcl6qzibbjqceo@osltqayu4meg>
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609230417.620089-1-alexander.sverdlin@gmail.com>

On Tue, Jun 10, 2025 at 01:04:13AM +0200, Alexander Sverdlin wrote:
> Add DT bindings and the corresponding compatible to reset-simple driver;
> provide the include file with reset lines enumerated.
> 
> Alexander Sverdlin (2):
>   dt-bindings: reset: sophgo: support SG2000
>   reset: simple: add support for Sophgo SG2000
> 
>  .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
>  drivers/reset/reset-simple.c                  |  2 +
>  .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
>  create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h
> 
> -- 
> 2.49.0
> 

I think use sophgo,cv1800b-reset is enough, there should be no difference
between them.

Regard,
Inochi
