Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F15224890
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446774; cv=none; b=Gkci39h6pDeNP+arRcufjAo0AWW7InDnYQEJNR0Z+5tur4NsUaDtukEEbOViO6uFnNspTQe+c7xjCJm9l3WdHF8gxmKzDLD1zvX/vqQJe85+WLvZ3nWnvthEckSNlPM0xugq4Bpea4AlasAPDdHBHyD9YcCwT6kuw3w1rjeR378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446774; c=relaxed/simple;
	bh=ZaJvxtjr/UbWDuYMsc++2AbU/9RuxaJOqfgbALnPUfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJL/h33xn8u6KvktK7pre6eYPau3plPwoScYCZJpvIl1HIZBL0mU0tDii8R7EUzkSOZC/N0F1pJGsEoaAojAsdlBTOzsYZbwrMoSDaz4tbkt/Bb+lSnOJAmVGYjqjMU2dALbetxJ7LWM9b+V/DL4tNZ/kenAZfzcmbM3pnJ+Mbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OkqqroQl; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OkqqroQl"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48d71b77cc0so26414931cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746446771; x=1747051571; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaJvxtjr/UbWDuYMsc++2AbU/9RuxaJOqfgbALnPUfo=;
        b=OkqqroQl0x/jqrx7vKiSH+a4gYhrssvcXVeHU++Q9KmgH5YrnY9ocxud3BTo9JUZhX
         7/XIncJ08fZBJni0ImFstaWuEfFim2XwwmbegBkvSEgSaQA4AfaI2FYc6QzXQnF7FqN0
         TPulG4Ib11i8jhTrWJqSgEuro1Xo0/m+VWHQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446771; x=1747051571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaJvxtjr/UbWDuYMsc++2AbU/9RuxaJOqfgbALnPUfo=;
        b=iztCG9y8zjNEet1Ncc9fT1YEhMcd7dyx6bgEtjh5Ncd7EyITTd8zmF7mWFyC4/s/CC
         tD1cmlatedfsg/tXT5rmzXT7Fnj1TU8hqSIDM5nLdZCO/IPwhmqeW2Wczum1xVu5zpA3
         j9xyoeKCtWOXkLZ4oKeuf6JGuwrTRFNPdpHQ7G9UwSS7Sxy7sPAskyIFSYg/ynDSKZcD
         +p5fWe72glviKKqJY60lRhHf+ENFSIteD8dqVGjIvwOSMjuBSDrJ5Qab6p3KhkDBtm7/
         T/zaPMuQyjNGCkX624aHs1q/oUNX9pZPmfgmu0zX5E7k405EEEp3UkNodJsUnR5vVd2G
         yEmg==
X-Forwarded-Encrypted: i=1; AJvYcCX+cb9Nqvxjb+NyD9ItrdiR2S4WWTdzG6jNJTqjndvujaMlVHn8fZmZWCwGXyKajuZ5HRv9nC0q0ngSw60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYYgIG2y5IbT4OSIR6sq7FIu8VairhI9+i6tEKxF0t3KRey0CH
	8mIz3Ol/7DW1O4vsp4rGikp3H+hxqUw6fcG3GOlH+fp7evT1nD5w4AYjojHhzcvMc4teZlWK3co
	XeDUl/enCV1/OsBI9P4GI3z1gBfLuLNB8160ztg==
X-Gm-Gg: ASbGnctYtvhRcuRmU4hldiG79UIsLfsQrdkoEad662UtAOTd1Ga+zAcaoM+icx8J5bz
	GXTXAgMOR7mMjJ09fCiYpTX4dilZ9rmzbObtJoij1Qz0WuwqNIIwaXnDbeYJn9tiBoBz0E8SShz
	SuluYJcz5T8e/8I42GuX+ny84=
X-Google-Smtp-Source: AGHT+IH8SI5HcYSna3MRmrF+Jzo/8BRtzzCRz170ITGYYplPbxtcX03EZBdhlPxtgELJAcnmmEBSdz/pDR9cUgg8qqs=
X-Received: by 2002:ac8:7f10:0:b0:476:8f9e:44af with SMTP id
 d75a77b69052e-48dfffb6db9mr101038081cf.29.1746446771515; Mon, 05 May 2025
 05:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503132537.343082-1-thorsten.blum@linux.dev>
In-Reply-To: <20250503132537.343082-1-thorsten.blum@linux.dev>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 5 May 2025 14:06:00 +0200
X-Gm-Features: ATxdqUGxKxrETQJZQnYyYx85TEL6U7n-PHMB2aUuzi2Lu_9JVdkOGXYmRq99yto
Message-ID: <CAJfpegu9rjyUWy3920CgJagdJ14X9SrrCcs3P7TrQvYkUah9VA@mail.gmail.com>
Subject: Re: [PATCH] ovl: Annotate struct ovl_entry with __counted_by()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Amir Goldstein <amir73il@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 15:26, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Add the __counted_by() compiler attribute to the flexible array member
> '__lowerstack' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS
> and CONFIG_FORTIFY_SOURCE.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thanks.

Miklos
