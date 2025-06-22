Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B97FC0A;
	Sun, 22 Jun 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750591197; cv=none; b=J0TX8AjmhPEXoRGFeip+h98w72lUmno1nfBUIEJYZw5Ss10MELDaolJ3xJKzgZ56Z5ANLKWrKImds8xcjTybqCn6y9zaDsqeWh/jomOiXWID/y62VwqF5Tda/F9IkyYk7MpuZJgQBjylPVQegUfDzjzbX+XEzkks8NCe5ZKtAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750591197; c=relaxed/simple;
	bh=m9g1hEg7UesRWLFBTzOOv2jhJbj3tfZzWpfaplVj644=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WidYoWewWRIQT7dwUr8ETLolQnGwLuFeTb/ar9DJNfEo8MVLNBnlQUIVvfLyRk84/JZH6SKSXt4D01MABSmuOxzLVFFRfQx0MgdOsOgIznGw4fmzUCPIIaxwZadlhyV0aU1OEpEO+ROdGJZ9wXINOQhPMk4XPywARuwtxA7enH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNrKypYX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNrKypYX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23636167b30so29891575ad.1;
        Sun, 22 Jun 2025 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750591195; x=1751195995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zj1dgADfdFV6IRKbspb8SDrNU3AE5RAH75YEHGM61go=;
        b=aNrKypYXYhSJEKmUHxtScZjLMysSJg79KvS3qHHOIMF/KS5mkQLS8id9dI85h99QGR
         4spn+TioBmoRJ6qYzGAt866a+IW45++Og1CvD1utQ9RNWeB1JG6WON1fKkbyu6Scv0so
         xL0pyfmo1qzpCyOkgCvZm8aP4emfw8lRHOT2X66rYSkg13zEC92L1cbdfMHh86M/zo+G
         ocBq/kiQ3KCOjEWpg3hVYMLN//9x8npkMBMGmGoh+N6+wL00asWmZgsW+b49XVMzKfqM
         p5FEBPn5EdFnu2U4Sy1A4VRtytWPz7O9S4ZKkmYsLoEbEBPHo9jfMzOto6Mc7GeJQt9x
         /ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750591195; x=1751195995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj1dgADfdFV6IRKbspb8SDrNU3AE5RAH75YEHGM61go=;
        b=p0LFOAse+5ONYWSGY8BL+uPHVMnjTKURcHELpqvjUo5N1ilPz7ZcnqLWCPWxH0XzyW
         /YoMkM7+EO5HFeDf270u+8ujrdxsjYWZpuG9kIL5oupygcCCOmR0934bZzM28CVznm9q
         A2IZkzEPj6G/LSxzdbw4ClZ5SkdVgcrK5iD3lgrmPMFALqiNXrzlELqjupfraCWIBXcI
         6XtoIadglgVuG5/rV1Pr5JpiLynhisLZ2vrwdvH8dLy5X+V2VVuaznwJg/QRRi1Eaf0q
         7cAm5VP1aiCGAX3jQHD3lJ7ACvPEQTMABL5DGwMPsKgm4HeKIr1q0rAEK5c+hcsA1ZJ5
         sAbA==
X-Forwarded-Encrypted: i=1; AJvYcCXBjav1SNaoJiKO+1UDwhNukmMW3TuPRzeFbyqF0S/cFwSc8XJA+17hrbsc14/HVBJVaYCq8QjBGAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsY/Nt8pkyU9JmgHqw+B6T30u0PO9OwE4sRxaE0CSerzM7qqeT
	fVerfXl7xnV5ObDL96KZFs/+mEgNOuVqmK+PWvdsEkT0IDu7EaYMpP2mQHPD+g==
X-Gm-Gg: ASbGncvQ0auV0WYvFmNPxtPyTS+Sy9ncxKQyuWdkay4eRigN05dhfo3EgvGywrGOdO4
	W/bCFSXqsDYUX8hWQHb5AtQOQf1vHv0tDG3YOv4Tq1HheaTNI2Phj9a+3fCrpk6k5lioNbSACgp
	eWKZLCKY4B+SHRiiJu2hgQxwuAd0S4bu669ZSqQvQwArjKGiIHXurLslE+4AWYM34IyvveE1lAb
	6fFe/dZIST3VtyTIf0yP0feBpMKSdp7nUQaGqZzOX7KvqE/a80k0aV1FJMOslGt6mPsOmleg7Uf
	b+Q8je53ECVAun6pzE5+CW9srz6m84Jo195msibqDLw5mSzswapAdEJ6/wx+PWYqBoW5xpCPSY9
	4RlSyiGFK6sZMOzs73K0XMyyx9cEggaO1
X-Google-Smtp-Source: AGHT+IG4qplK/uHPatkUiBNBtAUaw7oWxBWvWVYJmakmZ41+fNiJTE8EhuZ2gtMhwzhnAyWYgPSiUw==
X-Received: by 2002:a17:902:f64a:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-237d9a798b2mr120189935ad.52.1750591195411;
        Sun, 22 Jun 2025 04:19:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393227sm59753755ad.24.2025.06.22.04.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 04:19:55 -0700 (PDT)
Message-ID: <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
Date: Sun, 22 Jun 2025 20:19:52 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils version
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
 <972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:
> As reported by Akira, there were incompatibility issues with
> Sphinx and docutils with docutils 0.19. There's already
> a fix for it, but, as there are incompatibility issues with
> different versions, better to add a check to verify if the
> combination is supported/tested.
> 

I've been skeptical of adding such checks in conf.py.

What happened the other day was that Jon used a deprecated (and rarely
used) method of docutils which failed to work properly only in
docutils 0.19 (there is no mention of related issues in its and 
nearby release notes).

Your integration of parser_yaml extension will raise the minimum
version of docutils to 0.17.1.  I think all you will need is just
to check:

    docutils < 0.17.1

, and to make a warning regardless of Sphinx versions.

> After check Sphinx release notes, it seems that the
> version compatibility is given by:
> 
>         =======  ============   ============
>         Sphinx   Min Docutils   Max Docutils
>         Version  Version        Version
>         -------  ------------   ------------
>         3.4.3    >= 0.12.0      < 0.18.0
>         4.0.0    >= 0.12.0      < 0.19.0
>         6.0.0    >= 0.18.0      < 0.20.0
>         7.0.0    >= 0.18.1      < 0.21.0
>         7.2.0    >= 0.18.1      < 0.20.0
>         7.4.0    >= 0.18.1      < 0.21.0
>         8.0.0    >= 0.20.0      < 0.22.0
>         8.2.3    >= 0.20.0      < 0.22.0
>         =======  ============   ============
> 

<nitpick>

So this is what I see in the changelog (not looked into < 6.0.0):

         ================= ====================
          Sphinx version     docutils version
          (since)              min       max
         ----------------- ------------ -------
         6.0.0             >= 0.18      < 0.20
         6.2.0             >= 0.18.1    < 0.20
	 7.0.1             >= 0.18.1    < 0.21
         7.3.0             >= 0.18.1    < 0.22
	 7.4.0             >= 0.20      < 0.22
	 (up to 8.2.3)
         ================= ====================

This Looks quite different from yours ...

</nitpick>

That said, these dependencies should be recognized and taken care of by
pip/PyPI (or whatever distro package management system), and already met;
unless you have done something strange/dangerous and screwed up your Sphinx
installation.

My limited imagination prevents me from coming up with any plausible
scenario where these checks at every sphinx-build invocation can be helpful.

> For now, add a logic inside conf.py to check the above
> compatibility list, emitting warnings if the docutils
> version doesn't match it.
> 
> This way, when we discover incompatibility issues, we
> can easily adjust the table.

Does not sound convincing enough to me.  Sorry.

        Thanks, Akira

>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 70 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 3 deletions(-)
[...]

