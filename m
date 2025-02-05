Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B791946A0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771984; cv=none; b=ArKJ35Z645kSJ32YA95XQOmgRKhjgoar2Ic4IBkBqHrcLSfnxW3t+58fNVClD8qRwriKukNWf5ssitjWtJCeeSiGYvowZcmn+HrJmZgr+CFKj6LX178XbhqTTG70e6Np4AxsoOis6bKDwkwuYMQ0UQNRyE+Pbfhx9Lkh2o/n+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771984; c=relaxed/simple;
	bh=NvW0n/m0bGod2EuBRkN0yx2e0anmBtqXkeHXnsfUxZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3C4VBNuizXMVVnWLS3SEogqHPKYrQYO2j0JqpDbjjtThh4E/00bKwya01SOPbxiagLpBWV5EhN4KXFLt2m+kO9dGnXAnhAFlC3ExiAg4MGuLSJxbGFQEI7J+59ZkJApKpg6gkbyvQt+IZZhRoOJ7qjkMgm6j2kzfZoEWcqj/zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZgCyrpGr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZgCyrpGr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so2287333a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738771980; x=1739376780; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFRJZqny0JCLWGQlrfCbtC+cNwhgdx9Xm0sW46CJJJ8=;
        b=ZgCyrpGriYz309S/IKeZDSAaUoRg08FcGg8fdh0ltHI1huW2d44syXnmBv7nN7jQP5
         t5+eTqQdOeygnvP3le5DeJKG84HUe+1T8geDmvsIkZjEKoD9K2hIXE8gQ6m/OI4rUxOu
         RZmotbcF/E4pY8gdhrsyOEvBo5vFjp//vKYII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771980; x=1739376780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFRJZqny0JCLWGQlrfCbtC+cNwhgdx9Xm0sW46CJJJ8=;
        b=tgjH+CiuNv8rMK7/yG3R2mURPlZH2FT20i0FLoWOMKD2ygemgx8DUYhwtWrRXciMzm
         G8cftRpGygEASEc0/HLX24BfBWzpu/3B2xacYoajTRyCcC274atB6tgEgjppbENYrMlo
         gFERJQOQBLgeMcNQR6Slrz3sZLktuu5W7FE8lvm7ZvQy0HKzGBMMv0qA+47cMY6e/HXn
         jHO2ee/fJLAXRcR1a+QuL7Iuk1EtiBLJRIQcJv+jwRYAqtFb9Wq5YbDYFXnupNove0/O
         ui0SQazDudgc7UNhuYiO8TbfV+/GPdRVUPrsDi7fRKzhlWapZRdjHtvrubwL55wyUhHx
         pYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9all2q+FhGLYZrd2AezZA4kFFpzc7LATVDf0/808OO2BCecvLM0Avg5F8gItyoYqxjO4QDS9OIv6nnhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Ub7uSeUdWzJnKpSoeqxd1gR3fBA7mFxrtjNs4p/DrT6zUF1W
	jYqvv7ri3v6VhfaomRcfBnUH7MJ4ciLQ4hK5i7ns8UCSQ5FP40tg7aAgGYlwQYE4Fz1VRQNpxL4
	RZPk=
X-Gm-Gg: ASbGnctCoGr0n866PK8XQY8703hCGzfmKcxteamni8AryrEZfGH50dNZ4Wh9b9Ylxg5
	V585W2aX0nPi0thMIFToM5SNIuM0PkDQs186NMbnvqhCON2Y9RZRRAIyY17qqCXuLZxoeul9RTq
	BagklF5EmY3RpKGEYJXSxmUryobJOwm4Bi+AEP5qn8iZC9xYoxHoG7DPawKZaRlN9ryhLFMqidI
	1msm5p3zf8s5+b3ACVVSTQhk/5+RM91b1DlDsKctvdquOqS6O0sqKzMqVDV4Gv3a89cqyug0+6N
	PVf6KacQanNpYoRQ6T9inj7FVgUdy/qZL2FiHufNMk108Q8iq1k94DH9txSK5sl3oA==
X-Google-Smtp-Source: AGHT+IFQG3Kv1J4bb70QBWOJHiFtBAEMmDtIjlVaq9mbfsgh2qAoVRSRvwWRwk1rj2RGfU6Wjg6MQQ==
X-Received: by 2002:a05:6402:50c8:b0:5dc:dbf8:5d1c with SMTP id 4fb4d7f45d1cf-5dcebeea105mr57755a12.3.1738771979943;
        Wed, 05 Feb 2025 08:12:59 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c9cffsm11548584a12.74.2025.02.05.08.12.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:12:59 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7157cf352so215954166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRBIkZ8Ztug0fp5cI9qWLy1IzxdxlDRW+OvMnvOjoewP82LAfK6G3kmU02EZcjD02JneSeffPG4b+vuA8=@vger.kernel.org
X-Received: by 2002:a17:907:7244:b0:ab2:c0b0:3109 with SMTP id
 a640c23a62f3a-ab76e1dcd41mr953766b.21.1738771978576; Wed, 05 Feb 2025
 08:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124163741.101568-1-pbonzini@redhat.com> <CAHk-=wg4Wm4x9GoUk6M8BhLsrhLj4+n8jA2Kg8XUQF=kxgNL9g@mail.gmail.com>
 <20250126142034.GA28135@redhat.com> <CAHk-=wiOSyfW3sgccrfVtanZGUSnjFidSbaP3tg9wapydb-u6g@mail.gmail.com>
 <20250126185354.GB28135@redhat.com> <CAHk-=wiA7wzJ9TLMbC6vfer+0F6S91XghxrdKGawO6uMQCfjtQ@mail.gmail.com>
 <20250127140947.GA22160@redhat.com> <CABgObfaar9uOx7t6vR0pqk6gU-yNOHX3=R1UHY4mbVwRX_wPkA@mail.gmail.com>
 <20250204-liehen-einmal-af13a3c66a61@brauner> <CABgObfaBizrwP6mh82U20Y0h9OwYa6OFn7QBspcGKak2r+5kUw@mail.gmail.com>
 <20250205-bauhof-fraktionslos-b1bedfe50db2@brauner>
In-Reply-To: <20250205-bauhof-fraktionslos-b1bedfe50db2@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 5 Feb 2025 08:12:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=who0D=MKDijLTAtVZ=x8RMSQZg4reHiprgQKxDHsTGeUQ@mail.gmail.com>
X-Gm-Features: AWEUYZlP303UwXWRV-sLehCgNaqTR8x43_I3TsNboNYECfXum8T1k2bT3JbeqGM
Message-ID: <CAHk-=who0D=MKDijLTAtVZ=x8RMSQZg4reHiprgQKxDHsTGeUQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM changes for Linux 6.14
To: Christian Brauner <brauner@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oleg Nesterov <oleg@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 03:49, Christian Brauner <brauner@kernel.org> wrote:
>
>
> Btw, checking whether single-threaded this can be simplified.
> It should be sufficient to do:
>
> stat("/proc/self/task", &st);
> if ((st->st_nlink - 2) == 1)
>         // single threaded
>
> since procfs adds the number of tasks to st_nlink

I'd be careful about depending on st_nlink on strange filesystems,
particularly for directories. And /proc is stranger than most.

So the above may happen to work, but I'm not convinced it always has
had that st_nlink thing. We do it because some tools do end up looking
at n_link to prune recursive directory traversal.

But *most* such tools also know that st_nlink < 2 is special and might
mean "don't know" (because not all filesystems actually count
directory links the way traditional Unix filesystems do).

So relying on /proc acting "normal" seems fragile.

              Linus
