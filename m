Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88017BD9
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 22:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746398401; cv=none; b=nyugwT94iMKNoxTA6vUqDBsHmricfPOqN2C+vLjRp+2rUU27GyR0aVH3mWS0LvGF/Ob7s32Km7hzCx5+Kaj4kNMehWtkSkKvhdM0PjjIP3K+yS8xrkJkNecMFLhHXJwS0FNa7tXW5R1Xl0D6W65XGjGGifXfE1/XxUGvosvvCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746398401; c=relaxed/simple;
	bh=iae+viHuHAofaYHXT/mUKl9EP69TeDqZb0n1wjv17N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBoiQ/e95iuPTJw7qI8elV5EtyRlutg+HD1s0Ow0ZkjcORKd5z6867/Qy30nknQswIIRdxPC9nFNvGmXKRlDPdLXvGIHyBLlqQVM39ZHeLkzzJvyzDtpKA+SGYIIRqX3jYGmjNcFXyaLZgjsr0ISyZo0dUGVP7PI32UyWtirJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WnUKZHmi; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WnUKZHmi"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso4314414a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746398396; x=1747003196; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jCFGnCLIyudINJOqIdc4k35gvhxT2Qn0l46owtsuJg=;
        b=WnUKZHmiHY3IMcawcxME3AqdObM8/Sk4rGS260QLAvBGHAkkwQq4Kwl30UcUeZfpBM
         COAViEda+ZWrMPHLij2fy9sjXZAFsSjqEKS6akYNwhWGO6K7UOitbt+yleSxRT5AR9Rg
         XvjOHqwYNNADa7JA1XX1r9JCh3XBcgLSMeE9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746398396; x=1747003196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jCFGnCLIyudINJOqIdc4k35gvhxT2Qn0l46owtsuJg=;
        b=i/rTao3dQ2oeSB7/y/08sKD9dqHfrvYJ/YeVxEpAz2h7I4ojdC3MU9F4B5Xg9rjmCb
         KZzI+DC0uaz2USL5jTFxarMmFQwpiVBOmhg+fAHjNAN94zuI+8gxFKYLzNUxEf61S4ae
         OwDa94EW50IUzXTQICIf6j6d0d9f5Vyvpqd7TEIgr6Rq2VP3nb25YQD9hGXKu0gievqw
         OpyH16xvDT5hbspTGvMZoMu83ZxfltGO0FJGk/xoHzAJ8y/ZqR83uhRgctXnrElfKzvk
         RrETAw3cBuUjGmt7zK0AS+d2NY2TUctoiQXDnwHaqJ2w+5REx811GOiW393wL9JdEDmu
         a8pg==
X-Gm-Message-State: AOJu0Yzh/DGLDcPUB33Mfcz311VCYDOzIpjzhrbVFHs8xI9tp3WzPeMD
	kYiXOxLAbJTlZuXluwxE/FMuSzj8WhkRXZUYClueuJnq+8W3A4M1kJIkqJSs6AtjJoJrR0qScuh
	QvUE=
X-Gm-Gg: ASbGncv8LiO0l2bicA2pes7U2NRt4TWimaTo5Vtau/YsgD81lxnoymUAeMbfcykY8Wt
	BExBlmTknQvuyqQ/VyhXOmuF4ToomvIw/AYAyHecCT6axUviy7qXRAKna8W7qFBCEik5xvwqsLQ
	E80vT7b2x7hNnxBW5ybGP3rclpWT8BbV0I1P5RgmqbNfJWtC0Ffi/mU1sMaLo6crBDonMWUbyRc
	ELAnoUNV/UEg812P0sip+Q3baMunZhUNCwEfzZqKumm80KIsfF9BLTVeMxiq+t4Ipj0p3G5faFl
	4EiIhgu3Q/GNvpdSbleDZytUDNslbgtbfEk2o+H5kq63BZm5sEt35Oq+tVgtuzXHf7Kftmjv8r/
	TLCKZRXtCwCgatio=
X-Google-Smtp-Source: AGHT+IFoH1tCyuzQfoOzvbktuwgq2jcDLtVdWjUj7Oqjp/pnvM0IgoCV++b31o/PcPUlTDthwtwVKw==
X-Received: by 2002:a05:6402:40cb:b0:5e7:8e5e:4467 with SMTP id 4fb4d7f45d1cf-5fa7327256amr9791565a12.3.1746398396171;
        Sun, 04 May 2025 15:39:56 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7775ca27sm4516153a12.5.2025.05.04.15.39.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 15:39:55 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso6227145a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:39:55 -0700 (PDT)
X-Received: by 2002:a05:6402:26d6:b0:5f8:478c:6255 with SMTP id
 4fb4d7f45d1cf-5fa73272500mr10110093a12.2.1746398394706; Sun, 04 May 2025
 15:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
 <20716a80-2559-4d7b-b38c-65c402f22d87@googlemail.com>
In-Reply-To: <20716a80-2559-4d7b-b38c-65c402f22d87@googlemail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 May 2025 15:39:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkuHZbj4LaMfSh3YJm-fma_JRNASXko_gc8cd3SiVWeg@mail.gmail.com>
X-Gm-Features: ATxdqUE3mpQyo7O_lYNSUwihTWDH6PB3ux9m4xpabgGQBdoXnzRjfIYoNHBeinI
Message-ID: <CAHk-=whkuHZbj4LaMfSh3YJm-fma_JRNASXko_gc8cd3SiVWeg@mail.gmail.com>
Subject: Re: Linux 6.15-rc5
To: Peter Schneider <pschneider1968@googlemail.com>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, helpdesk@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 May 2025 at 15:15, Peter Schneider
<pschneider1968@googlemail.com> wrote:
>
> It seems like you forgot to push the tag?! Or could it be a sync error between the various
> geolocated mirrors again?

No need to blame the mirroring, it was just me forgetting to push it out.

           Linus
