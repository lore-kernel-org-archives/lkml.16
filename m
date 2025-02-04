Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04021323A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680443; cv=none; b=FwqJ6jqP3A16OokOC7Fn5EwgCv6NHcUs1LZbajOH6AMjcp+UQc6eWG/if2wDaJ9tRUHCSbAuNkyTg9iyVhPw2ScO7FH6+0e0bQKtot4EC2schwjh7A9mmTpzWTg+1KxtwTL8iqsQQO3vztNXK4up2/hGmlC8t+1Di24mx6kDols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680443; c=relaxed/simple;
	bh=9sSUvA2pf9s68H5xIKqnGcIqBfggQlWyoUWMwKLVlPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8PM444azWf6DA511kmb/PeqVrGHHlTzRUfwF/71Hq2xCcfi3b5QBzpRh+jT+Nz3zNdZJXn+8BnoRhgkl6kFoKyzw04dDtIOCVOQN9Wv0ttoZLGnxyccPrgBW8w2mIwxy+X35kft/k3k64lNXXTMVBZZgOOdvKE+fHgfaacGcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qh0XkdRg; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qh0XkdRg"
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD3D23F2F0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738680435;
	bh=n3EGoN50SBFmj+V3N+sn2G/FlvdwJ5OvZq5vVoZVOtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=qh0XkdRgasojQT3dkdOweElhc2EfqcAUGRJ5yFCxpR7iJxLXpkqnspKk3lm08bWnv
	 tvRPlXSM2RpB56BP4kA2ehbFVIH/beexGjmmgwRBj4d3EYW8zEY/xJTwCtjY8z8RzR
	 1PW7cPDZ5jxoWzDqaBFwxEJWqdqDvV/rc9qEGN39aicnhYhnszmq+VgsKAOK6AGBfu
	 nAEuYckRfBf8D2B7xFvomlFoh9JEESMkKNQCzAzJ8oWApgf900Vq3CHGI4UdDXQvvC
	 E62x+O25KSZEgYE4lPeG7/LGRlkourlbWH8PsqAMAWM5Oo/XcLhBHPBJvhu8yMx1HT
	 z2QogobxgmyQQ==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21effc75088so19100895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680434; x=1739285234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3EGoN50SBFmj+V3N+sn2G/FlvdwJ5OvZq5vVoZVOtU=;
        b=YS1GqMxJ+RmP2V+9ja0rnsWQpiDQD8h6+gMFiC+LjkEwLdYtD3H5A0kbF7vEDhx4zZ
         9+3Io16LA2VE+JRrBFmjKng6w8SXaRCdeWjEBvF2MncmIvCqyvbKYnwSZgNCdHDwCf4G
         iMeoVWOPqJhS5Q+kSyH3byC/T5RsqMmndREG85KrPQcMz5uNrwXAuqkE2AvAODwuP6q7
         OBNuC77Mq0LVUXmNE5r4I6l9grZA+3LzWERihRUkihC5axE4SmkgJKlit825DWyEFn9j
         j2km3MJvOJIJhqoT5Eka2Rx83EhI2cbKi4Ap/rqWi2JW9Vnit0bIOZDXOj+ysa4y7ERE
         9dig==
X-Forwarded-Encrypted: i=1; AJvYcCUsNP2FUKPvzRkZrQPREzXiX2tgzXJOHonef+xJ1sLl/Vf6bG1xvCMZDo5791WJF1u2dy72o/zPTnDRihI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEX+ntLdQbVBGnosOYP/uyPzFjwiZn3bvbzS7cb+Cr0SybLwl3
	trhmrv0B23eat1ogfvyV/Uq+XFyylpjf3Dg9d2AAUE/x43rdxRI+bxWtL2RoKALE2J6L8znVkIy
	kp0K50QNDLHy7lwcefcl5HLIv5fPzAK6+jAMJDThhiWa8XlfbMlShTtvTZGSnGGpJ6e9geypsFJ
	m7MS/6EF7PEw==
X-Gm-Gg: ASbGncssifcg37OJlZw6kYXk1HzjX32tzNUQHnBfciiIAuISbj5RilGcMpymOYKlXWO
	o7al4Jm+fS9ZC36XQAKenFG+SPv5/KT7JYOByl8j+S8fqtCngRcNn8vIaIOdVxt20d/NAKo3xXn
	hi/7pPu98RCpeixR+jYrhQrCtae0omWMlfUL0CV/MOBAWiODA2mvp4tKiTk3h94iR7ENpkDnDBr
	NOnTq/Fu3SXL40E/RiT+fJNKeXD5vU7aZdObYYJwcKbjw6WdtWOpi+3obxYkQ31ayTjeBIpOk2S
	r22v1S8=
X-Received: by 2002:a05:6a21:3399:b0:1e1:a094:f20e with SMTP id adf61e73a8af0-1ed7a5f06e6mr38741354637.17.1738680434211;
        Tue, 04 Feb 2025 06:47:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1EH4i9UWmswnm5lEyNNQ8DxaVfhJd/Qske9LY23x30Up5+/d5qYK4fAT8keB6BiGvn+0GGA==
X-Received: by 2002:a05:6a21:3399:b0:1e1:a094:f20e with SMTP id adf61e73a8af0-1ed7a5f06e6mr38741322637.17.1738680433910;
        Tue, 04 Feb 2025 06:47:13 -0800 (PST)
Received: from localhost ([240f:74:7be:1:45f0:d4ba:baba:a275])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe653a9basm10550590b3a.78.2025.02.04.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:47:13 -0800 (PST)
Date: Tue, 4 Feb 2025 23:47:11 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] gpio: aggregator: expoose aggregator created
 via legacy sysfs to configfs
Message-ID: <dm3enfd2hlhktozbax44h73qo3bw6bj6sqru62hi5pglv7fn6w@buve3k4oyfv5>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-9-koichiro.den@canonical.com>
 <CAMRc=MdQuQnmqFravDfvcoN_TUXgfZnJh5UxdRuYhECfmvAhGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdQuQnmqFravDfvcoN_TUXgfZnJh5UxdRuYhECfmvAhGw@mail.gmail.com>

On Tue, Feb 04, 2025 at 02:12:33PM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 3, 2025 at 4:12 AM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Expose settings for aggregators created using the sysfs 'new_device'
> > interface to configfs. Once written to 'new_device', an "_auto.<N>" path
> 
> I would prefer this to be called "_sysfs.<N>" as it's not really
> "automatic" - the user did create this, just with a different
> interface.

Makes sense, I'll change it in v3.

Thanks,
Koichiro

> 
> > appears in the configfs regardless of whether the probe succeeds.
> > Consequently, users can no longer use that prefix for custom GPIO
> > aggregator names. The 'live' attribute changes to 1 when the probe
> > succeeds and the GPIO forwarder is instantiated.
> >
> > Note that the aggregator device created via sysfs is asynchrnous, i.e.
> > writing into 'new_device' returns without waiting for probe completion,
> > and the probe may succeed, fail, or eventually succeed via deferred
> > probe. Thus, the 'live' attribute may change from 0 to 1 asynchronously
> > without notice. So, editting key/offset/name while it's waiting for
> > deferred probe is prohibited.
> >
> > The configfs auto-generation relies on create_default_group(), which
> > inherently prohibits rmdir(2). To align with the limitation, this commit
> > also prohibits mkdir(2) for them. When users want to change the number
> > of lines for an aggregator initialized via 'new_device', they need to
> > tear down the device using 'delete_device' and reconfigure it from
> > scratch. This does not break previous behaviour; users of legacy sysfs
> > interface simply gain additional almost read-only configfs exposure.
> >
> > Still, users can write into 'live' attribute to toggle the device unless
> > it's waiting for deferred probe. So once probe succeeds, they can
> > deactivate it in the same manner as the devices initialized via
> > configfs.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> 
> Bart
