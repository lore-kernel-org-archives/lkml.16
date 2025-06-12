Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208422F384;
	Thu, 12 Jun 2025 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749765835; cv=none; b=MRUwDqIpqZIb05F1Dx7AMxtM9gRkUMLhaoQw39IlpvObwrI1mdFVbm3m7f8JBjZfV+SG5/lwijz7Vc0uo+NVCWotgcxFv4BUTu0JxL7bkDsEi5Msj/qS7+S3QljwV8goG//YCTAa0kFCW8hxqP4kO+Xor5C75MukUd2Nol2iu0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749765835; c=relaxed/simple;
	bh=4/krhPPyShofR2SJXsJFmspVM1JoGVteQkoWvO0lb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2c5zwbZ+4luRLPJBsg8fUZMX3AEE9b32cs+yLICIJWU/AYU1Rn/QjOJncOd1dfak+Tn+IwolLoJfWkGPQA8E6TrtmUyeg83p8oh2lW8J5RNcxiQNbkHA9+K3hbcnaXBaEz34hoEeCQMaMKe1rYS+sLzq0qKCtngW7OsPWA4IMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hs+qGBnS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hs+qGBnS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so1247250a91.2;
        Thu, 12 Jun 2025 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765833; x=1750370633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=hs+qGBnSSInRc9zRoaNImaGYXBtaQtZaxXA3anqqHY9q7WsBAcYXAtYWhP/OHV31kR
         zd7ev4freQ8of6zIXP7PIyukHM0xy2rX1DtlSvYYpb17D2nkh33D5Z8VSVgTShkgVHG+
         cl4rBQ5Tb+/HldM1Td1NDyKGnxkFtPksC3jPbSGt8+KaHnrhD9hMkk3gCK1i1e/5iofQ
         PjKoNfc2yzhaQlXbLJUHH9JHlpWuGR9ST7s7Sv8xTJzjrVtoiI+P1NEUvf7R0QHVWKBz
         Itoj1JudGG9iojM9hHYQC3fTZodSseD0p9b45YEzkHKiJh3BoJkF5piKGk9WJr38T32A
         oShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765833; x=1750370633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=JUqY0qiLUcdqKE3PGgTkEPrWegCS5BiUYY+ZzePG1OJrVH9qKz4oMGn61QZ1UWVVdx
         ZunCBK2Rfo9WpB//RHXXzgXf8apx3Rq5Prz3tiTdStR+SZnovbtILS9oncpDzZtFyxAV
         L2Ptw9LtqDPInw4J2RgrtLMgGaUdrXQ/zzxV95OVJ0kxAi/Ifxlx3VFmbaZtgUne6hRr
         whCUdxuO8pANdX726oOpvgvDcsPIS8p5cakfPjlWa4G1SWFIrOq15H7LywL5HYLTF4Ai
         C+xZkBd8JMhOU5/wetsdYZGeaFXytqyJsaNrZAC9aeiZ92wO46x3HwqrFQwg7Dd/RIAQ
         f9pw==
X-Forwarded-Encrypted: i=1; AJvYcCUS6/2vz1uhPtTjhwabC2Zfyz1arBaAVq6nhRySTssNV5OhbjQquPah+1r433WkgGalq7A0dI4CKgps+nIl@vger.kernel.org, AJvYcCX6T3FGwGSdehEwZA1b4tSjeMGotHP5xowrLOcjnfVWg7eNDyyC4x7htF0Fk21ZQ/0+ihyU2Zguueh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2lFZ3Pfsx9hLEB4rWtIAAvvkFs5XLU+yD8qe/N06LPKSIngO
	7Q+t17AeOsub8PdAaNW8dFuoWNnZTfgu+SnM0JgdJH3TZGovdxYfTkQP1mhc9/36
X-Gm-Gg: ASbGnct4jnZutK7t+x9k//Rf6nRH4UPzrdigHFiGe0DvP1yfaKFqopUgdPKlcizp3iR
	7JY4gVqjDDSBmnIaJWkYfAhIGiiVsIwPJ2SBzAl0utqzEeT55zHe7ip9IGV4C38iEaFxogJ9coj
	mYn8hmC/gJtV1DpLnQ4lZ3oIx6JF+8m7VRc6GJRzT4o4nDUsJbepXBHNodZSQnQ0opa7e7xN+8V
	TL3fBiSe40czEmMz+1iJxkya9MbRdVqHF6aodsMtqr2XAJS0zRlq1hi/4CRBtjZbxJVrIJ5VDyA
	OJrpPzh2XNKZs1tIGrTs7cAt6EoHlsqnlb+42VErjuID+c1jw/OvjEybet6P
X-Google-Smtp-Source: AGHT+IFEKNLfpOAGCxAJGsac/EYqmS3wSquQaG49ddE1q1GX7taDoBx1GaZvDLzKHooYzWdOVmZGkQ==
X-Received: by 2002:a17:90b:264e:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-313d9e93c27mr1088783a91.19.1749765832654;
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365deb04a6sm2077235ad.178.2025.06.12.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:02:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-siesta-verbalize-6a7768ebc648@spud>

On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > "VBUS_DET" to get the right operation mode. If this pin is not
> > connected, it only supports setting the mode manually.
> > 
> > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> I'm having a bit of trouble finding the v3 etc, could you provide a
> link?
> I think what is here is sane, but I want to make sure that review
> comments on previous versions have been addressed. "dfn:" searches for
> both driver and binding filenames turned up nothing.
> 

The v3 is
https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
It is a long time ago when sending these patch.

Regards,
Inochi
