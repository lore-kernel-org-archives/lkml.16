Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EC231A3B;
	Mon, 23 Jun 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668665; cv=none; b=SzJPTESUC5BghQY29s8M6y6Rg9PJ4Kn6POxpPfFnKhbYSbw/uA4wLM0SCKZN+ntC3fZ69pB0NWG8SrdufKg0nuluZ61xlAkkiTrsWpY42vIxh5dNVyotVYSwHWcZIv5uxoypapvic8Rov87st8jVR1Tuw/fwOXxOZt/jXtdM5kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668665; c=relaxed/simple;
	bh=8maWd3GbIDtbZMp4bY3DiJ/4Wgbk557AhCCKytKsNJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekNfEtRndNnXzUrQ2s/4fMJMTfrGXSClslV06WA+7YuaxoQHfNZNObfwFw8RCkrLe7yZGg3nt3UXqVmY96IepzA3+YWAOTBqmo6RNwBvaYNlRv3xmBn6sbp17+5JqRnS/q67JLYLsjTlD4n5gsXJAmTqjXID8UTwrApESxkN1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4Dj7kc/; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4Dj7kc/"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60ef6bf2336so2801668eaf.0;
        Mon, 23 Jun 2025 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750668663; x=1751273463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8maWd3GbIDtbZMp4bY3DiJ/4Wgbk557AhCCKytKsNJQ=;
        b=Z4Dj7kc/TN8YDoHmKHot6daZb81OXR2qewPz4JvPSGwCdLvXGs0lNll1h5NVdZH/W9
         uVaSlBZw0dZFSRO0M58H7i77vLAXsunwNSOXhuL4Few4AMnJTBuwC/HR+pz494jc/SQr
         O6kngvnk6DqZbi9Tc7hTSvA3LsL2u1iaZVy744OUj/Lm/FtFMHOZX7YdKdlSMiddt22V
         Kf7xWT+1FfxQhB2g3doydgcS1W5vO1g1hHmQ9KogIbvgjMfv6kNA+HSbIdhD1IEL+tEv
         y8/0iftoljcnbbAhw5qSyzmzCoczmL3YJfqsV1RvxGidkI+0Hivaeab3bS1tErrbpmrf
         TLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668663; x=1751273463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8maWd3GbIDtbZMp4bY3DiJ/4Wgbk557AhCCKytKsNJQ=;
        b=FcdAfJ1aVpxAxyI7XUp2l9jlBetAbBx2A19puZRiYkFWT4biWmRlU0C4n5g75FgE6t
         CuZwnM+u/gTkBDxb4lct96hJs9Ni8FiJBoFd3JHPECsaGBpwriLhuvMRmo8OERPgEXuP
         TPJZy+V3kV0K2gbTlkB+vbrKJJgWUbb63T/b2clxP0FGWpCZgmBVf0hwvyLGwyOLnWk9
         DcMYp+NdZZW1ckG7ngz+xcw+Hs49EyZlYWG7OFZKaxjC17u90+eO/BkrQVTaZ7ZxhSIl
         3Ugv0XbOlcCLM7yIL+nQ0NNa3sPME6ML8r7IWcwrHnLtV3S3C6wo7YmyK0pEQrPrPvQz
         VPzA==
X-Forwarded-Encrypted: i=1; AJvYcCVX7aVtD+IUEwdIF80l/xHK6edqNJjZDKp0dkBW2EnacAtCRo8RsIWkv3xTZcvX5ep3SpdvL5p3maQ=@vger.kernel.org, AJvYcCWVNhK8voA8YowSQtOz8Zy1IgsLPCfJrIlaYmyzYEoWdLiOdMU+JQPsAsdOSGKXI0idn98H/vWMmpWyqDhx@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjwIny8tfiZLEzrP5IIwcj4JxE9Rr7h9S9iwCmML/zlBCYqLA
	k5t7g8nbM+DLn6+TfMuOk2163SSRS51rjXQH5RP/OO0QTXL2AsNjX92LS4B3g38ZFB4LRVbBNjs
	ZI0oQydYP9TB++SR9/pnLLfvTfWs03eY=
X-Gm-Gg: ASbGncvPW/AFEyv4adwBOtvvWcB5VPFDYB/cX2C7u42M28uIDyknJwPsxhAo7SyR2xg
	ntf4ZE9+2ysoLUeBhd4GuFAGDH48JCeUbO6xJfnFndc3muQzIA8tE11aj0aXf3LMsXYmygg8tuA
	Df6PQcO0MV7jKLsN31HnzdLjmMM1qA6VPE7f6y2gZuDbEy
X-Google-Smtp-Source: AGHT+IGubb7AAzvDBnlc+GagJPnVEYecGav/59sbAeJr04T8DTe5mwGsrPrxzbFHF3J31UjQsnvPTGgJQyCGahFrqD8=
X-Received: by 2002:a05:6820:178e:b0:611:67d6:b141 with SMTP id
 006d021491bc7-61167d6b47dmr6598972eaf.2.1750668662936; Mon, 23 Jun 2025
 01:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622004249.9083-1-sef1548@gmail.com> <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
In-Reply-To: <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 23 Jun 2025 16:50:53 +0800
X-Gm-Features: Ac12FXzCrW7v0PHfUCkkPv--UV6Xl1-d-xmIC8tIsL81PPD570oq4ubQFpg3Ojw
Message-ID: <CABZAGRGvf9Ge5EvMgFP3FUHt2QOpq6xXe9nB4=it9zb+V1DNwg@mail.gmail.com>
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for movable_ops
To: David Hildenbrand <david@redhat.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	akpm@linux-foundation.org, wangkefeng.wang@huawei.com, vishal.moola@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David Hildenbrand <david@redhat.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 22.06.25 02:42, Nick Huang wrote:
> > Remove Non-LRU Page Migration and Add Movable_ops Page Migration
> >
>
> I'm afraid most people you CC on Chinese doc updates will not be able to
> help in any reasonable way.
>
> --
> Cheers,
>
> David / dhildenb

How can I fix these things?


--=20
Regards,
Nick Huang
