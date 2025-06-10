Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08023717C;
	Tue, 10 Jun 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571662; cv=none; b=DceCrnuEE/7rxZwRRI6glSecGAIqn7FPGS8bF5yTv3kIe1t2fnnG9jPLAs+kSfpRZZJfezEVycILkBHjWwI+5k4OO+e+GSbGyCgndAG5O8VHCTzROOK3/iwaBA7kPJulvC5QFYZTIXwdDpXfbkm4jo5VdXTr26bQdLgIooF1N4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571662; c=relaxed/simple;
	bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hy3bPntALiAsAEYmc/uSeIs30Q3ryn3exBs0WcvFwu2Oq/lTt8jG/PooFKCMYI93yjpCrSsjt9fXNxDZn/5rOwATnh84ZdZRYPMVMSMccDHdk35itTxd6GBStGWoZrADoDqy3Tdx44+o/lKJBpSa3G10mlsHdbOZTgHEhzQdmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDHDwlw0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDHDwlw0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade58f04fb2so330801166b.0;
        Tue, 10 Jun 2025 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571659; x=1750176459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=KDHDwlw0axN5TYDliRaN8L/XFV+Bw1IKADrmX73F2cdvD98TpTCNkoTU5/qFqbjgKT
         pEu/o1HqQvue5abd6I1nlkeiJBaSKcUT8b8Svy4BsoS7Rpj++t0Lf4l+jAm6fMg8JOpK
         g2wV2DnelJtXis9jH1glIVNgXt92i4jlj+TA9lJ6IfmQiEuktYfzlzTrGJRutgJ1ncbv
         ES/tUktqezwpSkQtIogr6o90lmR92hjcFV9Jl/YgW7xXnAZBoFe2OW7ayCN7tXihOCxh
         UYptwCyzzYgkfZgK+eC/xPiDOV37OxtAjiDF3z41jKGBVXC21tuNaUJYp7b60KRywSVO
         gU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571659; x=1750176459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=X9lDbynIDilKop08GCjyn8Lvo2Ib7of8amXZN3g1CH1f6Wioz5W3hltaSjqxg/FaAz
         ixZsjgvAZs711cw3FnWLXDEuW8nGoHzJF+4/a+qKWeCEJwlTDAF0MP+k3rNxf72KY8PC
         CACKB20Y0EPqVI5/xJEfl/nOICZ/deoZWMvA2+AnrlDu9V6M+tethhO9PP0qxDsb6Otk
         zaoQpkJDCagjLX5f1Lzmw1tR6IjXY4K49fdzwzNPgQhwbLPK5V6JRDyoF73Sf+5DV+FM
         IVCTjUfkSzIfU1U0exHO3BLdQx0vix76qHadWoC66LUAtNPdOdu3vNlH8OfBDq1wCFLp
         QCjA==
X-Forwarded-Encrypted: i=1; AJvYcCWxczRU6msyXCiIoLOvo1glk8Q5QHvDHnWz57ZBnwUbMgAPrHKDhd5BgnHMlY/xu4JS0MZqPuTu532xfXMY@vger.kernel.org, AJvYcCX14lb/556s6r9JlRuD1AbCwEeV42Bi6KPhSfnFjxVKrDCHiBytf4+LrK409CLmZkKx+NeWEeYjfL/N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Mgn51myi+NCShpZ7O+aa73H7IZY5u7eOMoF+HsW0T/Nr0+Qw
	VDDxIKsv3x/2wD6vOsc+bMLR8PkoeRv9c7QtESf4JYhiiNbzuY+Y8WcZ
X-Gm-Gg: ASbGnctJusLKgF6NK3tmMg8EPiHHb9nsbu1oYCbpR8X/504imWzQAidIG25QWg8ff1y
	BFw+LetFcTepuIr/v4KXnKmxjgRL33DFM7RJUZa/ZBoz/fAmEphtNqUAfq0771yYQdqi0vdMPLU
	Sx8j/MLO6McPnU8zStpbVeezskAk2psDtzWb5PkfdDXsv/1vg589snV6cvWvZ6RBqIECXNU34c8
	pvJsUpkOfSLCGr7DfmfNsFsN0lcjREazeetYlnKlmG5AhZrZVkHKMxxIRUr6J+YY6kRsFpT41aq
	iJjMWgPJO9NPNfYvHN3TRjWf6lxbEugddnspZghAbd29NNfwsis3QAK4Gutk8yGskODwe8eGvw2
	UzrUkv3bwAXrUScgYp17gZAKU
X-Google-Smtp-Source: AGHT+IFBP4Ac0eMIqhVrxF6UOvlGCckI5Ip5teFsrW6N1rBQqfQi8L7Td5UuhoSZZjUStG87k5oXlw==
X-Received: by 2002:a17:907:3da3:b0:ad9:db54:ba47 with SMTP id a640c23a62f3a-ade1a9c802emr1697209966b.43.1749571659205;
        Tue, 10 Jun 2025 09:07:39 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778376e48sm6305308a12.18.2025.06.10.09.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:07:38 -0700 (PDT)
Message-ID: <c346fa54-41f1-4574-abea-a6fb2771bcad@gmail.com>
Date: Tue, 10 Jun 2025 19:07:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
 <aD0j3gXeD6Nn6L60@dragon>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aD0j3gXeD6Nn6L60@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/2025 7:09 AM, Shawn Guo wrote:
> On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
> Just out of curiosity, is there any ongoing/planned effort about creating
> a framework for access controllers at all?

no plan ATM. Though, I would be interested in knowing if anyone else would benefit
from such an API? I know that STM also has some access controller-related drivers,
but I wonder if STM's drivers and the AIPSTZ are just some isolated cases in which
security-related configuration is done from EL1?
