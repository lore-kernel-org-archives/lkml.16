Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252D1A23BE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745346126; cv=none; b=WqlMJ3p6FPNy98yBHbqp2DWm/DAIlHWAJFSaQqBGTnix3dqbGA87o2rFx7z+DJ0G7Uwk8WyHj2ajyMMrgtXHQAh9EGWJwXrpOaa82XU9G6wQcJxW9oKf4/2/Tn8idQw4H+uuLm80lbCQ4ZAVWIyiz1oiTa6iN+OzReZSSTkr+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745346126; c=relaxed/simple;
	bh=o6Rvwt3bk2muPLUKaZfPpXSAbeEMTyhE7PJSmQryzEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDthD7cW60TMyJ0pDB9vJYWHBiFdn2IH3BIn74zGbaX4XHYYjUcV55ueDwZ+KARCK+0yzFK2ev9UuxBCxb6mrfCq0FkRy8nDbIrNp8L3GTIIfqRahOgR/ERXu9vgk6b3jFEgACAR61FhrNKvg7XnYMThWtN5NcSXZ4WGfikjF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V+autGDw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V+autGDw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so8314266a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745346123; x=1745950923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j3ll63VqG9vTlmspUuUyoyOk/C7C+03/O1xhGVXIUMI=;
        b=V+autGDwytmYBZ0zceA4dGFGsFyu30Od+opQZShwJI6Fzzt7/NN2Ru52k2OWsXtkRr
         HXwWZ+D7UIErSbLDlLyfVHwyatVZi/o/hGQt1KwLGmoI/aRdbtc8SVTnitJ1D4NDzrQx
         1NI9YqSYxFFa/tYLCpjtNLV1nSm7ghWBoDwZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745346123; x=1745950923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3ll63VqG9vTlmspUuUyoyOk/C7C+03/O1xhGVXIUMI=;
        b=VCoTaZHWEB/FDRipwq0+Xn0ljIQwof8CTe22jHOhDl+JMHIzAcQi7UfyuPyW9xMGp3
         QiUIOVjMIFC08VEA1Gnd65CipABdndKI+Gtx09I0Bqf3vY4vyvk447fou6doHBPqmJj/
         XQH9hElA0VXlcfItce+rimrQwvpdoAOi+hblNGhrrDV4PI3au6vA8//WY3smA4Ma9iX5
         XsWQ1yQ3rF6JDMEuhGwzjCAh/HxpPuIP0VyDXt3F2kif3NXGGcfpiQ4O+1JagWDjy5EU
         rTazOY2+mK5fPLFBmwTjOjg2XSwrd/yOAN4xy0AXBkvCGi87fPyo1jOY/84bSeIIXcM3
         Vl6g==
X-Forwarded-Encrypted: i=1; AJvYcCVp5dFTjsxwoMwmdnNtcNMrpE+psz51unZMKA9CncIFpceZr7heX8ymZEWzZxc+eF5mKAw3vo+nohW0oEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxAUTjRCXv7lTIjvcCl8gNQaf8uqJOtGQT9vGZnSnfW4t0PZ7
	4Zwk//JCKRdM4RlaY7xmirEZkDyxadr+t7wjncMtu+sNa44h0g8cOGkQGLMINr8yZOuNy36OOsU
	4Y1w=
X-Gm-Gg: ASbGncu04fK59hZe0L3VsahWmBFmMnWCaQJxsrPEgLzVsu6hmkmTtFRUxv1Dd1d7XD2
	i7LeOFlVysCJHr1VJFliuvHULaVNj2jFaM5iDNMBnvd+CKDA6D9KeVmR4PJAC+8+FkIB/WofRrT
	R9plp3gLuVrA5PLRQDN45rFTJX00ltJQX0awMOJlVviAaEN3ezXRymppsEp2VR8yxskhdPhlqd5
	JPzWOFGOAxW4TtWMOhMWVyN1sTQ240RcWDR6vhWENA0vS1SONyE6Om6/kRwoh7X1IEMFEuFfc7j
	weFIiTzK0QNXalzHdXeVEOJBxgHXMwlnGLAMJ34NPjZ0DVVohJfVvxFR6m1tMR0zbS7ByrqVLFp
	w8WTb1NPlaaTwV3mu63kM2ulzQg==
X-Google-Smtp-Source: AGHT+IEj007okLVRuqiSKdHwxUmWzUnCiE4s7wqaA26b3DUQYarZgUaj+JMz47WRDdG+lukAoEXz3Q==
X-Received: by 2002:a05:6402:234d:b0:5f6:20c4:3b0e with SMTP id 4fb4d7f45d1cf-5f6285236acmr14192669a12.8.1745346122608;
        Tue, 22 Apr 2025 11:22:02 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625a3e212sm6255434a12.78.2025.04.22.11.22.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 11:22:01 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so8314225a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtAulQ7aPY0tm4W4DsNkjPq5e3arcfV1tPpHkudiCY4oXrRsRnUlnmBdjcsyDTyMzUDbWjQ5rS4OmfRfA=@vger.kernel.org
X-Received: by 2002:a17:906:dc89:b0:aca:c7c5:f935 with SMTP id
 a640c23a62f3a-acb74ea8f76mr1249698766b.61.1745346121461; Tue, 22 Apr 2025
 11:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a3c81bdf-29dc-4d57-8cc7-138cd16e9d5c@oracle.com>
In-Reply-To: <a3c81bdf-29dc-4d57-8cc7-138cd16e9d5c@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 11:21:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3Q+U78dz7M6R_qzbH41N=3h-2-KAw8-DY4a8vpDhR-A@mail.gmail.com>
X-Gm-Features: ATxdqUE77Jwim4HrfFpj9Zre0DTQC3Qu3HHFOhYdf69FlBWE_EOrxga_NS91jGY
Message-ID: <CAHk-=wh3Q+U78dz7M6R_qzbH41N=3h-2-KAw8-DY4a8vpDhR-A@mail.gmail.com>
Subject: Re: 4b4bd8c50f48 ("gcc-15: acpi: sprinkle random '__nonstring'
 crumbles around")
To: Chuck Lever <chuck.lever@oracle.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 11:10, Chuck Lever <chuck.lever@oracle.com> wrote:
>
> Hi -
>
> I'm seeing this new warning fire with v6.15-rc3:

Yup. See commit 9d7a0577c9db ("gcc-15: disable
'-Wunterminated-string-initialization' entirely for now") right after
I made rc3. Oops.

             Linus
