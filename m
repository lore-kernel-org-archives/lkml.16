Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71902367A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619703; cv=none; b=T/+icH5Fm0Ih005hocKe/DoaRp/JEeToVxPj8/JZhKCBVA2rUmRftXfvbXteXabR/spDITQnLaRRI9A2pds6CAzbBirQ660Ol/WANQ517oL9zbFS/PqsWQjxmeLRTSFFrsTBu3aac1f/vJGAljCfbdhzUNj82HYPKG2UtSfyDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619703; c=relaxed/simple;
	bh=cgjHpUz8BtnLjZRTP/FjJK/zDa1i66hzbMk9Ok1IraU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SVfeI6e1sZxEeuVQiLxG8h2N/36QOtN7/lzSnK6tNJXclvRzw2EovgdWupv9gKEODm+PowiT6/4YlDB7bMMMq3YQIbZ7ff+7+Zx/r1+wkp8RzXNTkOIesBptporNGDjt7NRn5MaRuvBdTc6N5lvgADH+qfRk9C/NXGzMdIh36Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NLQQq027; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NLQQq027"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744619700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIOpVQV5D5BRv1xgM0IAwIJtm4jSxhzbncofktJma8s=;
	b=NLQQq027yvOkI6uQRc9lLhoL8ofMrU2rJO2xaFnWB/hvymPM2/dIuFyZMSx5mmet6UoDZy
	pqwrUOMUtj2GyPQASym+yu9R0z7Q7WyRR7/q621p6BZyY/U2spbEeq2QYsCif87VtAQVO4
	j37zUtM4s7OUCv6HAcmXcIhYrbsPtzY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-huJ2hBUNNsmmq4Nyaudg8w-1; Mon, 14 Apr 2025 04:34:58 -0400
X-MC-Unique: huJ2hBUNNsmmq4Nyaudg8w-1
X-Mimecast-MFC-AGG-ID: huJ2hBUNNsmmq4Nyaudg8w_1744619697
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cec217977so24554935e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744619697; x=1745224497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIOpVQV5D5BRv1xgM0IAwIJtm4jSxhzbncofktJma8s=;
        b=w+u10yE0QjagphOI0du3MSmXI4MRND0RrK3Rv5VAjFHtsbudc8hy8n0Jj2MCli0PYW
         OaHkzg30gfZtxLRHK780GDBY66pljSazfri2FgsQZuB9Eg2VerAfzeWQFOWnhyhehDoZ
         ezge00yd3Mnay/zjzEPqhjp4lYm6KPoroH/J6jAB0WxcOQIlEwotxW7hPrE4gnuvsGAw
         3AOn9vUItgOWvBK0Mj168vUHS1NVt5avKhCaFPdd8PCclgKyQEcYEkivM4LxiJxPmL0/
         U1xqswBEMBmm0jr7crcxmJTr6VvrSZwCnARHL8YDOYMB7sYh2/9Z77cHL8tipGwb5X0v
         ljWw==
X-Forwarded-Encrypted: i=1; AJvYcCUu1STiJ6QVXWfqWcHgHrdadfHoS/wV/50w2eGF2isrT88RvC1BAUpPMzHjpOKTuLLhDUvM8qEI9sCu4DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzt5oTgMCACIs9qGXKln6XK1yi1jri5awmfTsECxTSxBkzSSpe
	PKGAAnI5vkTz2KCUdvH7WdnNSRfQYn363CrQBLN1xqmNmtFxhzYmLFP9ZxECXRRRAIcvAkHnwHj
	/rVBfSyslOHfsvqO5othVZg0J6rpI0K84GE+9DUw829oqCVR/xcceDRqVBQEI5Q==
X-Gm-Gg: ASbGncs0QVWbCw0B+/Wh40coWRkm0hQbtTkOLQm2kdRrtWeyEjoUXfUGzQap01qssib
	yo5wlLcOv4rxSjieQVjgzUX0DdiHhZo1kdNqAW5i23CWY24OxIeRsigg4BAbMvbJu1KI1AH6qqA
	2PiXRme0WH/wTvdqh8eHcGyEwBVQS5RoVV+TIgcMsDCbUOlDTAUADQiXYfTPP6hd15m55DSmlkt
	/K1mT4DsIZWwRIWE+AGSIiF+sDQy8Iq/ozRXX7Yfgs/eVfeRXhRs6N2vaJHXCMHsOPG4Ny0tx2B
	MBLhJWM5Zb2vPMFdfNEK4hmATk/G/wusEjCYxw==
X-Received: by 2002:a05:600c:46d1:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43f3a93d3ebmr93206775e9.9.1744619696951;
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2U5uao+PT6g/WVNEshEebN9+0Vm4AajYz2grDM3hxYYZf433Ix69Xh8i1SCWSRFS+d7XLw==
X-Received: by 2002:a05:600c:46d1:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43f3a93d3ebmr93206485e9.9.1744619696509;
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm10395145f8f.96.2025.04.14.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
Message-ID: <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
Subject: Re: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename
 del_timer in comment
From: Philipp Stanner <pstanner@redhat.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: akpm@linux-foundation.org, guanwentao@uniontech.com, 
 linux-kernel@vger.kernel.org, mingo@kernel.org, niecheng1@uniontech.com, 
 tglx@linutronix.de, zhanjun@uniontech.com, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas
 <bhelgaas@google.com>, SOUND <linux-sound@vger.kernel.org>
Date: Mon, 14 Apr 2025 10:34:55 +0200
In-Reply-To: <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
	 <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-04-14 at 12:26 +0800, WangYuli wrote:
> Commit 8fa7292fee5c ("treewide: Switch/rename to
> timer_delete[_sync]()")
> switched del_timer to timer_delete, but did not modify the comment
> for
> snd_korg1212_prepare(). Now fix it.
>=20
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: SOUND <linux-sound@vger.kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> =C2=A0sound/pci/korg1212/korg1212.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/pci/korg1212/korg1212.c
> b/sound/pci/korg1212/korg1212.c
> index 49b71082c485..5e69bb25d420 100644
> --- a/sound/pci/korg1212/korg1212.c
> +++ b/sound/pci/korg1212/korg1212.c
> @@ -1553,7 +1553,7 @@ static int snd_korg1212_prepare(struct
> snd_pcm_substream *substream)
> =C2=A0		return -EAGAIN;
> =C2=A0		/*
> =C2=A0		korg1212->sharedBufferPtr->cardCommand =3D 0;
> -		del_timer(&korg1212->timer);
> +		timer_delete(&korg1212->timer);
> =C2=A0		korg1212->stop_pending_cnt =3D 0;
> =C2=A0		*/

Wouldn't it be better to just remove all that? Or at least document
what it is good for?


P.


> =C2=A0	}

