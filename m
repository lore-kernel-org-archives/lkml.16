Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC7216E1B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966639; cv=none; b=mGnLfILv92yHwrEtgQAhczSoXNyN//bUzhY5qPx2uOmo9kAyr7kozv+8nDFou0pm8iwwsNXibR2MbpdsY71dqKyeMM+iuQlw4cWHwhZq6lyv08t63WXDbD6u1f45WVjwsyangIwzUCLwQHC33ozdb4d5XRhIJ4Ov+4NnSzolVZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966639; c=relaxed/simple;
	bh=8krmq6gGLWICnf0RDzJsoQ7XVrbV+7ACHvk9dokG9rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocEMN8/tCHY8WsFcQgNnoOvAH8+mke39JXFqisC2zpn1Hg7Csz5ldlNBU1/H7HC29tNd+yVd72ekf6LrUw0+UrOBcIeHdcvOfv5vz9IoCgx29eaI5u23T7buuF8ffjKB7jGz+MipIw/5Aw1xxXL44GmLtlp9xGuN3kOVeTLI7s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=B+FClEFX; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="B+FClEFX"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-7053f85f059so61628517b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966637; x=1746571437; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heVSgyVKUb+FAm8sFJ+MihlxtPVid7pXn+732rMtMEE=;
        b=B+FClEFXj13MZ/uaJ/1kesJVtP2DjvqxSY3YJdVL6sZsj8H60S6lE5WbfdjmSPBrKK
         G+F0uNhYMuruOa8WgFsV6nx8BuIZSHlhndfukzY7NbRYTMEmThMaq7uoePKPcsYqzNTU
         3WTaMaoJZ5A06LoItiViTWxli0ClUyzfQYSm4+c4HZh/tWBNCz6kWWS81J6wbURM2Fsx
         FgfXK91s/t5mo8/MBOHkHLOnhhDNBDJF8InSw3m3luc6KwvoHmT/p/5s7ZM5MMrH6rcl
         R2uIVSW5na7mzOytugz28DVQp7qiLA89n66J1O/hDQ4DbsoCouyN/0pW+2RFRmtjj9GM
         NXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966637; x=1746571437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heVSgyVKUb+FAm8sFJ+MihlxtPVid7pXn+732rMtMEE=;
        b=ejMk6vqITzURLFXkLHU6ko1WvzLi3/oO8r4DLJEGwL5YjABPU+dRWIgXwEvPZl71W2
         4TCYF8JE+n94CplPDkyKJCXBv70ZkuTxl3jprBLUc4bH9FqPuuho3YnGyDS3i/qat/Qc
         9ILjm30uVK6OGNrTLkF98MQXWkHnbwBLVhX8VjWh8+60zb8Fjl85Aw/Pc/c51M6d3Nvu
         Sl7DClkWBzY2QOGMI53siPrv001b3mNq6S4sxVFBGJPrNKTEoOk1Q6F6BHe47T7cw7Z5
         AikVzYHImf+PHU8hquUuNnwKzAJR3i/LCmjvaQwBKgnJH/i6PM9p2SxYzdq8qYhcXEYV
         IG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzfVBU2xVGWnxJvx7AlFCBgode+dUygAhkRbDwQLSH6IUnoTe0Mmd5/vs/5VW6DvfRLJFAXc2PEI+xdig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpAtbzZAgfS8z/tHj3DDebqOisG/E0EtCyupkWyJ8WVj0woNuc
	vEpFRen1ewoe2eq2yQhezdRoUI6Y1UEgQvi/keGSymzeFI9Q+7BK0xVaFt0V16/0L32dgBME/ug
	vylf5dW2XvryGzGPtHbqT+zgzNVfj4C4jj9OalztD1WTtPx2c
X-Gm-Gg: ASbGncvWo6PcWIdz5fjZzMhF8uUyjaHy39P1uEnvn+kKjq0x3Wk4ylPwq9w61fh5zwS
	3qIIQWNGuxbFTD3CXcOIhEMXouR3WrbSQp3S1mJ1nMtVOK66Rz31fWEdfV+XQqjFe0vBzdY9KUo
	gjLjpj9RP5e0FRZqflO29Kf/M2DoN/ld3GG39ocKCW5FBOi0kbr+hiaV2XJ45glpWKsdJZVjsP7
	Ouunkw7EMGSqki2XHrczrpqzBN/3C5TnJ4N4m4JOdPokeQFNym1pl6mL1WuGMDx0k8LlRSF9AAL
	0pIBgX58fHwJZBDzi9MpvuJXD8ZDfu8=
X-Google-Smtp-Source: AGHT+IEz4rx1/5caK68tQaO9b1jaWJL9Vugr0d/32zWvxjD52I6FEeimg97KRMlrDUksPPYZMyAW7+pUA3Es
X-Received: by 2002:a05:690c:6210:b0:6fb:9495:1650 with SMTP id 00721157ae682-708abd7d841mr21149987b3.11.1745966636991;
        Tue, 29 Apr 2025 15:43:56 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-708ae00cce9sm75537b3.17.2025.04.29.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:43:56 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 650BE3400C9;
	Tue, 29 Apr 2025 16:43:56 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 59D8AE404E6; Tue, 29 Apr 2025 16:43:56 -0600 (MDT)
Date: Tue, 29 Apr 2025 16:43:56 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests: ublk: kublk: fix include path
Message-ID: <aBFWLGhuRO+Rlzon@dev-ushankar.dev.purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <20250428-ublk_selftests-v1-3-5795f7b00cda@purestorage.com>
 <CADUfDZoKictpMvAgu9FPbHRLVns4HvBgwddsCBgHsH9nhiK4AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZoKictpMvAgu9FPbHRLVns4HvBgwddsCBgHsH9nhiK4AQ@mail.gmail.com>

On Mon, Apr 28, 2025 at 06:14:18PM -0700, Caleb Sander Mateos wrote:
> On Mon, Apr 28, 2025 at 4:11 PM Uday Shankar <ushankar@purestorage.com> wrote:
> >
> > Building kublk currently fails (with a "could not find linux/ublk_cmd.h"
> > error message) if kernel headers are not installed in a system-global
> > location (i.e. somewhere in the compiler's default include search path).
> > This failure is unnecessary, as make kselftest installs kernel headers
> > in the build tree - kublk's build just isn't looking for them properly.
> > There is an include path in kublk's CFLAGS which is probably intended to
> > find the kernel headers installed in the build tree; fix it so that it
> > can actually find them.
> >
> > This introduces some macro redefinition issues between glibc-provided
> > headers and kernel headers; fix those by eliminating one include in
> > kublk.
> 
> I'm curious what symbol was redefined. struct iovec? Anyways,

The RWF_* flags. Here's an example error:

In file included from /root/linux/tools/testing/selftests/../../../usr/include/linux/io_uring.h:11,
                 from kublk.h:25,
                 from kublk.c:6:
/root/linux/tools/testing/selftests/../../../usr/include/linux/fs.h:318: error: "RWF_HIPRI" redefined [-Werror]
  318 | #define RWF_HIPRI       ((__kernel_rwf_t)0x00000001)
      |
In file included from /usr/include/sys/uio.h:179,
                 from kublk.h:22,
                 from kublk.c:6:
/usr/include/bits/uio-ext.h:45: note: this is the location of the previous definition
   45 | #define RWF_HIPRI       0x00000001 /* High priority request.  */
      |
