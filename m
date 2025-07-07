Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902B288C36
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885151; cv=none; b=NCNYhE07uca1udFwD0lFvDsbtLGxMMSZvHAe8hMr6G4V+/aO5TFefbkAcj/VDbvFDYGoD69gsuYm2NxuZ5r81M5vsV/3TONU+skhWO3sGWI+j7Sb9HkkQ+DKHXTytufpPfGLbkz/Mlpt3adBgUH4Q2YQqW6NAg7LxmyKXqBoMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885151; c=relaxed/simple;
	bh=b7KbqS3K5hgWRRq1aXtk6y6SR9Amyy8CoyEZ8zCgO9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/+3GVx4UMz5zsXJinm3giYpBdnmtFjQRJ/q5NqTAJiKjMcie6GRCsbwgwrpvk1Us/vx+GncYHdjiFOK6REghc95YKedgFgHCUSz0tYBHhpQX6gIZgX3H9b+jqDTeH34j5tq5+2x5IqeJCTWPlDiw055C2arS7rhGYyctlgBS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=pa6v77IV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="pa6v77IV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so17028025e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751885147; x=1752489947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dulbg7eB73WIH94OjTxuC3o37sfRTac4DL1JQQTITCc=;
        b=pa6v77IV6W70QnSxUIRk9TjiHt5kOOHZHkoRgYXx6DmKCZJKa/JwWYaAGVXFtl5Sr2
         g3qVp5ceHVk+DalZC7UMI7Icn1GxDxk4Ew7MqKfQUBYU+xltfLZol/otu5l2JVqIjTkE
         S9CeAx6yvCVbOpySIMPXJbAj/ilqe7pi+47FTn5Zr9vyHEwYLtwVNILjcmdfD7dwAiSf
         z48b+lon8IBMF0Q4rE10riFGRmEkH+5wszztP1Uvmk4lj0777KhDPx+wir6CEBC/ID0K
         e6CF+MIXYcVgJ94XxzJhfeR/d+ElRSJd7TtsNao6dHkeh9DtwbpJDzOmOHuy/h5mcUkL
         tsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885147; x=1752489947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dulbg7eB73WIH94OjTxuC3o37sfRTac4DL1JQQTITCc=;
        b=wSZ2QHGGVZ0cYKKie06p7SQtQXLZJhJs6YKwivS5dDlqwzH/4aK13PgYBEeHlWz5dG
         CsXzLgD1/h/1LKz8Pk9RjDmQC4z3qlVNISOMWX0IWnL1w3NoD39p29TGnDhaarh4NoQr
         /z1eWYus09OnkaOSsZe/d592H+2fQ16NrhSyQSyA3AClGTmbMUN2htmC+244jf45T7BW
         HweX1VmFz0RNFgh8cUixyKeu6tj+sAQ48G3D7dlV4snGF12wJ5B7XfAVz9aXBsHge0Rx
         ZPg6WOKckcNXyn/lr3yiMXTwkT2ScRLPs2NNekyWysNeVct1A5Ql5LMEOq47P2guo0So
         W3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXC21BFLErXIlpf+SYAjiU7hfpoOGYgqjo/TIZc3L98k8cCfmg100jjubflSQQo7Us7lxMPSOTrx0dNm4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAACAGs95j+0NLmS/6fE9zj5e6HEcUbqNK2ui4dgSRR2kWcs7
	+fdpPJrnkwkLukF0kkq1k4N3WrKA8QcIWJ6g7Z1Utxr4w0l/IKE+0zmuzRNlhrN8p3o=
X-Gm-Gg: ASbGncsrhZe86rufNtEZ+frFgbFkav1q3YF2gtw3baoJgaGOkD1AC/hBV41k5jXqqcz
	viYtnf9PzWq97w72prFg6eLsdkhlui+1fSvcE51L9HXVlnRdHbl5GwX7iG+cn01mN7rytEbX++4
	EupnTibXPgIt4xsA2iICaz5nMO9V9YW4S8Fes+Hs7j3hMQoMU6kV9pgymnXwqJTAlH+vEwX5Joc
	n+dD2LKEn2rJBwgJ+BBN55PoDsaDbnn8gO0Xc5pJ+XmXFky7M8Njb8fJMJx5+gRQKT4xGpzbyYr
	ft8v7GXHDcEswGFklFqNXT472O8EVtraw+pBd+JPlObjXv5TRB0QoDLi9ebqY7jeJTftSUUelgC
	WLGl0
X-Google-Smtp-Source: AGHT+IGKQk9zhutAHOyPFFZkrsqw8HIozJBejbXflmsPTS/6ir57FDvqDFPniRmrjLUj81aK8I9iQA==
X-Received: by 2002:a05:600c:458f:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-454c6db327bmr17760985e9.11.1751885147447;
        Mon, 07 Jul 2025 03:45:47 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm96925045e9.1.2025.07.07.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:45:47 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:45:36 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v13 12/12] dpll: zl3073x: Add support to get/set
 frequency on pins
Message-ID: <x5qcp4arm7q4547ftvhpdm7r7zqk5y7dbtdke5ncilqimpn7pp@5d5vsxxa4oxr>
References: <20250704182202.1641943-1-ivecera@redhat.com>
 <20250704182202.1641943-13-ivecera@redhat.com>
 <idzmiaubwlnkzds2jbminyr46vuqo37nz5twj7f2yytn4aqoff@r34cm3qpd5mj>
 <29fb9fef-59d7-43f1-9c45-d6f5a4fe9818@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29fb9fef-59d7-43f1-9c45-d6f5a4fe9818@redhat.com>

Mon, Jul 07, 2025 at 11:46:54AM +0200, ivecera@redhat.com wrote:
>
>
>On 07. 07. 25 10:32 dop., Jiri Pirko wrote:
>> Fri, Jul 04, 2025 at 08:22:02PM +0200, ivecera@redhat.com wrote:
>> 
>> [...]
>> 
>> > +static int
>> > +zl3073x_dpll_input_pin_frequency_set(const struct dpll_pin *dpll_pin,
>> > +				     void *pin_priv,
>> > +				     const struct dpll_device *dpll,
>> > +				     void *dpll_priv, u64 frequency,
>> > +				     struct netlink_ext_ack *extack)
>> 
>> Unrelated to this patch, but ny idea why we don't implement
>> "FREQUENCY_CAN_CHANGE" capability. I think we are missing it.
>> 
>Interesting question... from the driver API it is not necessary
>as the DPLL core can deduce FREQUENCY_CAN_CHANGE from existence
>of pin_frequency_set() callback and also if the pin reports
>empty or single item supported-frequencies list.

Yep, the same applies to the rest of the set function. You may always
check the setter it present. I don't recollect why we have capabilities
like we have them.

>
>Ivan
>
