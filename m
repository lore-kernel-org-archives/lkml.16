Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29D0267396
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169132; cv=none; b=de7zWwlo73n+WSsSLVN8Z7N/lxznK4MPeI5aV0+SpCGogURG+C683oVCRr4WC2eAGqsCb+OFf/UCG0nhxPbha9vErBhH7ZuIcgbGND+A9Yj5UXtP5GYXg18a/wBYT+L85VNq+UQUHOgmRNxpLBKF1Gk2IhaI/q4xB81hwWV1izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169132; c=relaxed/simple;
	bh=Ieqy6Vlq0seB/kAFgA7Ecjs4XwVCI4d9i3fbrrs6AkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJMj03WRSenJfaPiH3Bzp33PSAFNBhYeJv9mbAOXntYE8MLtY4QQOiYt2CV923IWLjxx/l9blFGuqFZYZP8ZRw8fUnqkcKgsbsJe4W7acG4eWRF4YPJkLtDtH5Es+mxf+QaMMpHfZF7ce/mWwasqgvfovlf0J6ejLgCLuCL3JL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhVFXB0o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhVFXB0o"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so8110075e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169129; x=1746773929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UrDLrN0STmh57lhKtIA4ppYT5NWnb6ArnxWs7Uv4bU=;
        b=lhVFXB0ol4OJbvRItAOCpNeRUuebbNDproUOyYW3WvtSB69U05QYBxxv+40ZfWeDF9
         RFjmhwnNoMVQBbb1nUKCeCP5KCE9ujToT4JrWwef/KAn+vW0F4ECweB9urVFiTBnjjAu
         O139Jx723+rKHhHZZE9qfZ7JV/0yxPGNTr+b52Psw3M2ptlvkEt86jP/SKyqGqgvvcG1
         TpxTFzZephzRp27Vbv2GnPmJ61ff8qBGzLk73r+X99e9nThp2JL5ilxLrvKOmgaYTYjM
         YuUvufl70olvpoeECtkdzTxAsnATVokrAO8mqDVmguU0Fey55BK/NzXc7m03xvjBt583
         3yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169129; x=1746773929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UrDLrN0STmh57lhKtIA4ppYT5NWnb6ArnxWs7Uv4bU=;
        b=ELU8Mkj1JdL3v0JV5VoQ5W1Ji8PN04rdZGhZjtf4cblAPamn/3bGb8DcwqxlMsbszx
         L/pdC/t4AM6yZ/iWqdwRcXZdZOoKSvlTPz/ARPFo9M5mdLtG1Le1z7dWnJg/IPvh2eG6
         FVkErtMKPEkE1PsO0qw0KGU1EKGhl+hZjEGS822q7qF5TfAg17uwXB0rLXnoXgNQUiOD
         zjophAuxY38Y3CxesV/Wf408uaAUqCVJUizIfbc/KZqEaIPCBJ+2glWHRSISNpBvXfeV
         CZAGIJkoPpllgjP+BViCJbx4HZDk+Lwyl7Ys4j5uBl92sWHTDfzhk8AcNqHfDewYHxnx
         67dg==
X-Forwarded-Encrypted: i=1; AJvYcCVsv2AGnZPRbokbjf4GMzNUCqlemwBAk5v2QqaWFRBAP3UqsVDmXvKemh95UwuM7T3qRwtnuRpzcOgBy3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iB2JLUfX/buuPOPWDdA6jCTmE3PlI7lG3dJrpRJ6qhuLRAhK
	Jpevr3VxdyPUWP4zpABgsW4/e/ZfVaW00f0yHs8u188N6FFfNtd5aCBNcG7kACQ=
X-Gm-Gg: ASbGnculjfZEfuAweJ/yp1tF9sYAF4Hkx/Ff+dvWyuygP2qexxXiY13E23SvQ9XLMyz
	9m/1MR5dGO2/KtvjEGT995+W1lLcHbKbf1fcmeSOlZrZgiMy01V7upXGUwwdkyPBu9sCZkV+ZY3
	Eqe9FIBXNsw356ktgbGKLvZmJtBO7MVZAb/Ezjh4owm5z37tejeGFHutMQTP97wsIAye67xForq
	pGriXWQEHCvyZ9XCypuuMrTFce6e5qj0QpKniK14bYiOgkIMYq2yvHroO8zIKmU9TKbU7lhqLGa
	IRk/tqky0xHlWAkzjLRBb8rvpTm4l+Nwp9WUnA7N2/RnRw==
X-Google-Smtp-Source: AGHT+IFm3VmQGkoJ/PJmnMVYZMpPi5eS4/UWvY5W4vECygPV2rSBSq3+dhElYmoVoGAnN7FvKvDcug==
X-Received: by 2002:a05:600c:524c:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-441bbf2bd71mr9406265e9.21.1746169129115;
        Thu, 01 May 2025 23:58:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2ad762fsm81385805e9.5.2025.05.01.23.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:58:48 -0700 (PDT)
Date: Fri, 2 May 2025 09:58:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com,
	yosry.ahmed@linux.dev, muchun.song@linux.dev, yuzhao@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH V3 2/3] mm: add max swappiness arg to
 lru_gen for anonymous memory only
Message-ID: <aBRtJdD6P1rgTsuA@stanley.mountain>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
 <aBHYT27M1tRxNLRj@stanley.mountain>
 <CACSyD1M8EZ-qEhSGsLTAs+i+YMGPMw-+39Es1SLg-OxEbgg9yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSyD1M8EZ-qEhSGsLTAs+i+YMGPMw-+39Es1SLg-OxEbgg9yA@mail.gmail.com>

On Thu, May 01, 2025 at 09:56:57AM +0800, Zhongkun He wrote:
> Hi Dan
> 
> On Wed, Apr 30, 2025 at 3:59 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Wed, Apr 09, 2025 at 03:06:19PM +0800, Zhongkun He wrote:
> > > +             /* set by userspace for anonymous memory only */
> > > +             if (!strncmp("max", swap_string, sizeof("max"))) {
> >
> > This pattern of strncmp("foo", str, sizeof("foo")) is exactly the same
> > as strcmp().  It doesn't provide any additional security.  The strncmp()
> > function is meant for matching string prefixes and it's a relatively
> > common bug to do this:
> >
> > intended: if (strcmp(string, "prefix", sizeof("prefix") - 1) == 0) {
> >   actual: if (strcmp(string, "prefix", sizeof("prefix")) == 0) {
> >
> 
> Yes, I understand the difference.
> 
> > I have a static checker warning for these:
> > https://lore.kernel.org/all/30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org/
> >
> > If people deliberately misuse the function then it makes it trickier
> > to tell accidental mistakes from deliberate mistakes.
> >
> 
> if (!strncmp("max", swap_string, sizeof("max"))) {
> 
> The length of swap_string is 5 because it's read using sscanf, which
> will add the null terminator \0
> at the end of the string. If we input max into the interface,
> swap_string will contain max\0, which is
> equivalent to the string "max". Since we only need to compare the
> first few characters(There are other
> possible inputs as well.) — effectively treating it as a prefix match
> — I used strncmp.

I'm a not sure I understand.  You say you are treating it as a "prefix
match", but sizeof("max") is 4 so this is not treated as a prefix.  Did
you mean to write strlen("max") which does not include the NUL
terminator?

regards,
dan carpenter


