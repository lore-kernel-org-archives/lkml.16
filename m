Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040871420DD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214134; cv=none; b=FfilnyzhEety7FPU3fpvEYba7op2WbXroDRdLUT1H0FWjaxYV0kAdCgtxEyp5WQjW0hHe6qzIr/kjDg8O2WqDMy0kIdJUU20+CSFeHDHZDkhLzFQufrYfbqXCSzSBElx1rzBCtSupaSUKoYZjdxNuG8DDm4+zk88pFD5w/ndfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214134; c=relaxed/simple;
	bh=0+HnC31GvY6wN6NHBG+s6TLkjag8zoKgbsytjbA+8VU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owqKYqZHrP9JnK8VYEqabwoz/acILjfW/bbFcghzG+4tWWtwYVR1cK54aQnKqjJgbQ9NmvOu6n8v+TwMhr/+xpBDTM6gGF6Cwm98xLgb4DFffZM6TRoX5Bpz4Zl4uzrqg3lUMKq6oVbHXy3TzDdTENOFTkeGmYjrLb+IRzIzDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zd4sLRTm; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zd4sLRTm"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4772f48f516so38713231cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743214132; x=1743818932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=Zd4sLRTmUW6HQC6GFAmBRH7MrnLNxi7cH1RByvhTQoIMslcxQmqTDBd7DeywkA5ezb
         WQC+GSQckqVLU8eBttjDq7GiRynTpREusrUvHKUCZaHQuLjPokE+SPQeT1FG10bxYj9i
         OUHD2oL0TZ2PvVnYILE/YyikOt8TnIJXxunUgkOHdsC7udMptcKy9r4PjG8U3/LvFDSs
         /ih/SUnlMF62GnY/OhKQPL8/Rm/0uqmbWRxQ18qA5D79WB1R5Bu5vCnzEUEPt2iZ4O7q
         9ztK4q4jqXZV8GFZI+5/0acfwu+jy+rwVJAdZb3VocwJpBcd2Pp6fMNjIhvIq53dZaLs
         82Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743214132; x=1743818932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=o0QxoS4eC3Nye1w3W05h4E3Bjs5uO8gY/Jm0Aigvk+X8Q0Nuk4ulKABLjPhkihodqu
         3M01N2sjx+KY8khCA3HxrwM86x2nWAxXDz+OEpyLW9cN73gQyflxAC+3o0fqqm/UW1zv
         XnG1n/GoelMnR65nXhZYk8bXPFBLPcadE3mC2P/EVRYTwDO28Ai2iki4sOQIdAjsIA7K
         IQ4hjLiweP5KIA8bWqemcA2Xeoov9+TF4H77UO+CBsCjNfrrt1AoWnjoZNTu5HVC/V7D
         qPFrj3vOWvpuEeygqjiS2wSeFeX4tawd+j0Va4uy5+gKM8nt5fhp/wrb3CYwVQjs9mL9
         CzGg==
X-Forwarded-Encrypted: i=1; AJvYcCW7hSrnIzMwGjS709xO7bL6I2SiPBvzLaUabLb1ORxfp+LOCnLekKO/iwModLkEjLISnv6W8bEMlAIHfmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8MCc+7ksha6QHByhTUDLDZCLzLTNh8x9OzgllIWJ3KDJcBWHv
	IiKNgsEKh2l4JXoaKiEy6ERJYgQ5JkPl5XRxHwniCz8mfMHhOVNM4VMlAu67OCU0+sPbiU5GWik
	=
X-Gm-Gg: ASbGncum99neoj31yldb+jaNgscT+U9OWJ5HBx52WgkWinfAq186t0aCor8h5QSWvhM
	CNssnnavuARrtjB3rFFjgrYILxa+GMEx/lTyP0YOH+BY2KkArjU9MwAYwHtt63vaGNAvUCzR9gQ
	UOZojy9rp7Ug0WG5KyhJvgIlSLPYvvQrRdUXtuTTh8i3galgu/L0TfxV02xjaGWkvgCz3X80Elc
	Rhk9XhvdoVYkwY5UFxYouyG4LvbMzffYjxlxQVyy4m+camQ+yDzchrPgnw1FcmtPFdSyJB8Xk3t
	KSqnhnSCyGNX9Ojyl9/kENn2q6d8urTVhEiwvdUrI+If
X-Google-Smtp-Source: AGHT+IH1L2+053HKjBANc7GI5t6N9eFdk9KEPgNwqaYsT0C/dL/Gef0yLBObqVY66eNPyS88Tua+Bw==
X-Received: by 2002:ac8:5e46:0:b0:471:bd14:a783 with SMTP id d75a77b69052e-477b3f4a757mr27665491cf.25.1743214131601;
        Fri, 28 Mar 2025 19:08:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317b416sm18061541cf.50.2025.03.28.19.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 19:08:50 -0700 (PDT)
Date: Fri, 28 Mar 2025 22:08:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
References: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-bEBk68dh918vy9@shikoro>

On Fri, Mar 28, 2025 at 04:45:10PM +0100, Wolfram Sang wrote:
> Alan,
> 
> > Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
> > flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
> > following Wolfram Sang's suggestion.  This tells the I2C core not to
> > allow length-0 read messages.
> 
> Thank you again for fixing this issue. There are some USB-I2C bridges in
> drivers/i2c/busses which also do not prevent zero len reads. Would it
> make sense to put a protection into the I2C core? Can we reliably detect
> that an adapter sits on a USB (maybe via the parent device), so that we
> can then check if I2C_AQ_NO_ZERO_LEN_READ is set, and take action if
> not?

This really should be handled by someone who knows how those bridges 
work.

In the case of dib0700, it was clear from the source code that the 
driver uses USB Control transfers to tell the hardware about I2C 
messages.  I don't know if other bridges work in the same way.  In 
theory a bridge could use USB Bulk transfers instead; they aren't 
subject to this restriction on length-0 reads.  Or a bridge could use a 
Control read transfer but include extra header material along with the 
actual data, so that a length-0 message wouldn't end up generating a 
length-0 read.

So the short answer is that you would need to find someone who really 
understands what's going on here -- which I don't.  Sorry.

Alan Stern
