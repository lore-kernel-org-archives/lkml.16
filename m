Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353022FDF3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018514; cv=none; b=gyAaXG4jiJ+MAxuXgWQD4hoyGs4Whmtreo8qgz3FMTKbHs4jY6/6pg7KRJv8QvkAssLrIr2+yIVVFxdkQfXW+ZCTpPGwrfAtxqG8TNBWq7W6e/AoIws7H46Qno1KQbRJuz1o3XAfrcJ2iBDj5LG1voUieYvyt5XfOAdVFSy+iDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018514; c=relaxed/simple;
	bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBiXc07h1U7y2pjD9fl3o5XrIRC4XKRa0YnuXOGVh1zxkDvbpSjxM9Q2qZoOussh8jlGxFUxRv9Fn286h/ebhbk8p4sQUze36xgBteGPGrBIxBruMZrQ05/O8P6L8cZ2Ly7jNFBBvk90aqHypDj3JHzFk/pWcVl7VnDW2yEVJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGWdLp5p; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGWdLp5p"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-477282401b3so43130001cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018512; x=1744623312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=;
        b=YGWdLp5pDMLki9HORjQKiKXaDtQ9Zxm2YRUDdrUQKW/VpYxLv9yytlhcqVuJ7BN7Lo
         p49UfJFPeL0eQ3MdWyvXyI1dp+tDjQdQS7vcaLqNUlavK+ZYn53CL9vrGVhZButcMOJ1
         qzCAs6aRGf+8O07HC5/Vb/WmelVS7u2+biMg0j+tfUW6p4OWOKUSWUcIbuYwDAcNTre5
         t2eMyauLToQbg+ac5q5o928GHP1tXZ2Z6lLBbxFM8Fil4icyssPWw/CFies+lO8BlzdF
         KSJvCY2yDqpo2XcDF2zVYlitPuf18Xi0fDVPS882UEWof7breMVpKznpyK5HhrP2QepJ
         5YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018512; x=1744623312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g172mJCzRlzwf53qGkvLIRDbowmzXfpFnIIJlJG7WRw=;
        b=kXOjGp0b9lO+vPWU6KJ8kh1phLKmOQnwNkgsRYODy1/IYn60eoT4r+mMh5nYuxxO/T
         tza/idw+eg2GGb5KTyPblhTHWumCTXmehWy6gvTMUdwC1mR6BNsBs8zb/7q/fk+hiN/j
         UBEfVPOtKsVaA3of0teRGjO9w2yn+PYPgB5+utNsl415q3pybvdhB5RUgjxDZXigK9MY
         lwzHkdnuQb13F7hBJU/dFL4OpIX+0BcgIxAZXyC38yWXBktvBD4nq1cJIIVH3Mxk+UaJ
         KQPnz2gVI2Gd2rbgON3shUoIG0MAK5vRzxcY3ufp3Ie7ofBfDzPEpu3sFXpf4zeMkDnk
         mqvw==
X-Forwarded-Encrypted: i=1; AJvYcCXbkBTmWnoCI12nHIImJGFznH4CuzpyZLOsj0WgCTRwp6upK9K3n3rARkIhEVRFC1YsM2CrID6qQBbDIiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TCSAZByFtnlwlcl95L4gRRqwdQ4hikpGzz1MPkhOaZ6NoVi2
	hta87jYamnKR4wRn//tMWfRHe90dUlha+weDA8ZkuaHmLeREKvAjmP6n/tlKwtfP4/Z3+WtrBVb
	LOonkUI1afn7KWXXkiB7xGPbEF2k=
X-Gm-Gg: ASbGncu1IHtRDKbDFJfZ34q8lfgfYixUiB9Pdso1ZLeP44IypU8UvstKK00j3It8Ngs
	bXWvuy5+W89XL3zUxY4yThCyM7+90y9CflWgn7t5Di98dABXuXtg2EkzXTMpzAhWZQwmnpsSM0G
	lox87e3vQZPZ7Vmh8gkj7MpRg3oQ==
X-Google-Smtp-Source: AGHT+IGhTrrSc6uVMmD7MMBQ7qTCrg2uDZuofOTM4+WVDylk/fH4UUQjWOWK0q8EfUy00jeuyFyYxrPKBAte+ZhzSKQ=
X-Received: by 2002:a05:622a:1a0d:b0:476:8ee8:d8a2 with SMTP id
 d75a77b69052e-47930f77cecmr118271881cf.4.1744018511946; Mon, 07 Apr 2025
 02:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com> <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190712.858349-3-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Apr 2025 15:04:49 +0530
X-Gm-Features: ATxdqUFGuroWUppSQpVAV3779ZjDlCQcJ6dl21DBRUh7mRzwMlpd85_9x7QbSys
Message-ID: <CANAwSgS5rpR6mbE0tHqx3Q8_KjOo3F3nAKQhAdxzOLvQ8-sk5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: amlogic: meson8b-usb2: Use the
 regmap_{clear,set}_bits helpers
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kishon@kernel.org, vkoul@kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Sun, 30 Mar 2025 at 00:48, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> These require less code, reduce the chance of typos and overall make the
> intent clearer. No functional changes.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
