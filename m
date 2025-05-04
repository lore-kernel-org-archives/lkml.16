Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE1176FB0
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746396904; cv=none; b=K3FL1YZ0hwYFIGzCTPq+WZF+R8pwt4CcMYKOAt2de67Pu77YCiwwZYq6ZGdz7lj9+UPexCfwQYHcodmPNbfT+keYA2n5R6QtNNdvOokQe/X6ZwthJ+HDecPyoBJL32iJRewSNq4jNYHrHXAukxaZLZgINEDr/H0KbsAavlgx10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746396904; c=relaxed/simple;
	bh=oJzMaGLKlg9h4L9ti+ddiXnkE6zmtIYSy4X05Ww3WQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=syVvY7nFI7+WsXXQdva1mCUuMijp0ZUZGY4Qt2WwRyqf5d5X3HSRKbVqNKGSRUsKy5YHu3cXb06K8Ddta7D+MA5nOXVImzbnwJtIU2fYSygyBtleBDX+sDxAI/Xkf5jdUZqdIvEUF1t4LSXa2VFiYSj0ZipxSuPa2WT4kfNYMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=jtJEmaxC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jtJEmaxC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso21496755e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746396901; x=1747001701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7RZZaqdevrbuBwZnfIs7y/z4kPQzT76Qz65EI8B1zg=;
        b=jtJEmaxC8VdN696R5ZpeVRyGLu4ARIukErdf2PdLziYnPnuiYsRJdXblHl3WjhxPHr
         pkrXMDrZNwDOSNY5ToveRUtyYoh0E7mEfs+GIxaAxoW1RR7QxEfPQkJxjuuNUHxjZL1H
         a9biJEKBHg9RE5+uGT3lAjZ6+g3Hhf4RTPvtvbV9JCSi9UQbILq5T02rGxJvihsLKfi+
         gEhUeblW2PsBt7CXSwtljQeR9NSM1LJnr/GW2QFVlKXYo75l8YEC26//h7v+BtlqAc4C
         MnQwzsXY68SwyaCj/T9pzNL4vLXuQ93sfOC3+O9NJXdecdTcRfIXdeyvOnsdAAM6HEgO
         /KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746396901; x=1747001701;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7RZZaqdevrbuBwZnfIs7y/z4kPQzT76Qz65EI8B1zg=;
        b=tJfpiffGpuB/fDFp+AKNEjiwJWRen7wxW7x/m02E9EZPW/AzlTsZ1bw2EdxRwq8r+k
         k5CKp9XehXF33P/w83jTfMee9fAkZMsV3OdBUdUJp4vgtzeIGExBQ3A43Zr74l9L3W2D
         4drchipwCVFAyv4FGWjUGV+bftznYSUO1c7kWUUPHia1dUeptS29RhW5QR29BGSpUfU6
         YDMdH13eZBWVIxCizKFXP4eKRA9KWFnXgOlHQoPX4U6LbiBQhGgDNEKUAMVpJGZwMnVd
         QkHNFZlmjkBZVOZzJ7exZprlu0AwxzxP7lpxIFdv04DWLNTFztXJEpzC/wuD4v3s4xlB
         ea5g==
X-Forwarded-Encrypted: i=1; AJvYcCWhLiUo2YmsVwQs9KEZrD+Jxa4ogy4km5r/9JEJBXEbIS4WVN95pt/ha7zOMlEC44AA0GGMDljWUciD7R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrFTJ9VKCeU7RNIDWdVapKplnSj1DzxFJcnSJOglBztdAQLdz
	zzRdy3OqyViLBfATMQoH3hxlHELaz6mt8FNQ29U2zIDl0f5ZiDJMeCkB
X-Gm-Gg: ASbGncs2n9JgbYyeKekoymtYA8RHnsp864Qh+IRKTlpt5zsgFrGRP+tIFGNDF6a54qT
	PiJLQejte98Lqg8OnDIAL9AX3NDmA+VMU1Z++T3U3H8iQLGsbMge2eljNx6XCen/fUaVunvMmra
	mHdWSthN7bO4LRDfZUZjqNWx5FMreA+76AEX2/5dZ0q+1URCxqPJxdHrkp6nFd0S6lb3/a+pKNW
	J96sZ6ve7asDNqXM3gkhN0SCV635jkW6Scg/VFB+iuzZmD9+No1nmy1A3EgQumOU6smjMNtOCMA
	d0i+dGvL5Ky0sqa6AOHBoa1zBZP2bbflmXFULtHgkdf2oF214Z9dkeJSoW+32ql7F0nsARPOFdS
	1bUmtfQdDxzggKlKiLw==
X-Google-Smtp-Source: AGHT+IFgcG6EQDWPuOWFkAmlvWeGCXhFGXE/Yqyi5u415gnFtExmAQnoTFpmKt2HZsWMCJWStfdUOQ==
X-Received: by 2002:a05:600c:a405:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-441c99f3c6amr16610105e9.4.1746396900753;
        Sun, 04 May 2025 15:15:00 -0700 (PDT)
Received: from [192.168.1.3] (p5b05708d.dip0.t-ipconnect.de. [91.5.112.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm160252265e9.28.2025.05.04.15.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 15:14:58 -0700 (PDT)
Message-ID: <20716a80-2559-4d7b-b38c-65c402f22d87@googlemail.com>
Date: Mon, 5 May 2025 00:14:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Linux 6.15-rc5
Content-Language: de-DE
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
From: Peter Schneider <pschneider1968@googlemail.com>
Cc: helpdesk@kernel.org
In-Reply-To: <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Am 04.05.2025 um 23:09 schrieb Linus Torvalds:
> So we may have had a larger merge window than usual, but the rc
> releases continue to look pretty regular.

[...]

It seems like you forgot to push the tag?! Or could it be a sync error between the various 
geolocated mirrors again?

I don't see your -rc5 tag on fra.source.kernel.org which is what git.kernel.org resolves 
to for me (I'm in Germany), but I also manually checked dfw.source.kernel.org, 
ams.source.kernel.org and nyc.source.kernel.org, and the tag is on neither mirror. 
Additionally, I found that the TLS cert for nyc.source.kernel.org has expired. Maybe 
that's the reason for failures to sync?

Adding helpdesk@kernel.org to CC...


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
