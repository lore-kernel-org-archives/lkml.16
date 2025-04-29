Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8B48CFC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957069; cv=none; b=cT/dCa9mSv+01qEeKZXX2oVwNzL9nL+LIjLT+jchKh6wRYRTOtvfE70xDi9cRQwzhJLQAKqKRS21mbsYjAQU8WYpMMZkbZhZXHJ9S/gB7bLypKSZ/oi0s4kFE/wTSI63wsHRCfgPSfADpKmZ1dC8Pr223CKctvnEpDWzT8kPLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957069; c=relaxed/simple;
	bh=mIDBgyIrGai5i2PevDFrQWDS2WLUPqJT0lUwwpqkZqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQnStdYUGxg34kNWQ7xec1xMGMFIvDpo/h2giemloBDrkNX+/5X0lg2y3YSUD515URVJe/spAlPnp5oMwmyu4TbIWt6vJZj3PYswwtAigQGhYsUp3iBi18pWhhvbavAUxdWzy6iLHySPB0fTWqarUm6uby2fPxuki6ta8kjA9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=yNxtPCwA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="yNxtPCwA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227d6b530d8so72195745ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745957067; x=1746561867; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LawO1f4/ezKmBz6/weBaTcmEk8JNPzax80742Sn6nQg=;
        b=yNxtPCwAe7lD+ytg0a/9F15O/xnKFG1Gu/N7LEnq1KP4ncrUklaT3XbwjEPSyhipyD
         XdSOmI1wqi2voj0p+JmqbMnxIfpqQ4I5S27k7VJySzNKGfpncpmZIP0nQ4JdcDnV8O1+
         Hfpj2xWe1j+RF8EQ7C3mzeQiKFc6qwGkJC9d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957067; x=1746561867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LawO1f4/ezKmBz6/weBaTcmEk8JNPzax80742Sn6nQg=;
        b=RQZtQ/WgtohtRwlLSXAvNLe90fUelka2/vSnGmnONF8zmCg8S2nPcGwGyPd6TYeEM1
         +a2HU60TYi7LqwKmLN4dXfarQQAKMxltErEnwmED4loJcEJA2wK8xyhKqd5fEmuz3SFV
         d+bEcMYwCNJwMTs8pgtkJuHV973ImwTS8P5kcoOEwPsS/3cR1rJiSHBlbHE3vpXKOfhd
         D5OsSOksgnpUU8rIW08MNsIKrBoBWF9kjs+wNMdnajXS2jLtw+0NSxmqJFzXMqlWl//6
         7rI+eHRozJZqc8O4NXw0EGUnV1CoSp//+eoUcQx/lcVh6TvlvVPhyjP5OAyrjMULvXq8
         frsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz9vygaFy2KH6eMETFqbqf3dlPy8EbkvIwlVFK435CwDSmTHvbgIL27PtHF7MZIMVPW6DLQNWIwqMNkjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7LqfezGhtE4y2Gog8GUOote7ESX70IRH2p2lD0V0yx1HNwag
	KUMqp6VLrAy9QyVo43MvqYAxlbvUDinOtQ7uFYIPEl69zZpa89ozJCExHSrXMUY=
X-Gm-Gg: ASbGncuAajySMxc7eQ9C2kbkIjdCaAGKR7+jzFq21Vd7frl0zIAldkFp2OLycqdB/+i
	9bIqexkofTP+QgQrkDT1M4YWyPR+EKZ/BfQxb2OYOOQx2tkElKlW7HJrFtdYWqAfZSFPCGmJ+QE
	VG1MMncDa/E9mkAUDSD2WcXfIOjJ08BeUx7Vyf5j7or6CGkLlfqpPGYdf7GkW94RIAYKiV6GG4k
	uNitwDlU44+yeAmb6XTwBqzqK1D5z9MtzAigni/0jRK2Fb8x7IMSHYUzRCPXNZE9TXscR+gKtBA
	PyK7cZ/OgShyWyhZSEMaMYZdlxsbs9oqq+k7IH7YbVy3wlrhPJGTi/8yl0C4N4zNrr/cilmxhJe
	UyabamnvYKVwY
X-Google-Smtp-Source: AGHT+IGU1RP/mRANwzOjXe0cKgOZefEpYNYpcqI8RxMrlNXOANsV0zmRwyjxkpQy8QrrzJi5VwNW3w==
X-Received: by 2002:a17:903:4405:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22df35cad23mr8306975ad.49.1745957067559;
        Tue, 29 Apr 2025 13:04:27 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc2119sm107243345ad.91.2025.04.29.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:04:26 -0700 (PDT)
Date: Tue, 29 Apr 2025 13:04:24 -0700
From: Joe Damato <jdamato@fastly.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Mike Pagano <mpagano@gentoo.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH vfs.fixes] eventpoll: Prevent hang in epoll_wait
Message-ID: <aBEwyNwBuihjvQ4g@LQ3V64L9R2>
References: <20250429153419.94723-1-jdamato@fastly.com>
 <CAKPOu+980gvzd-uXUARnYQ4V++08spfBVj26nZapExVF80ryYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKPOu+980gvzd-uXUARnYQ4V++08spfBVj26nZapExVF80ryYg@mail.gmail.com>

On Tue, Apr 29, 2025 at 09:28:50PM +0200, Max Kellermann wrote:
> On Tue, Apr 29, 2025 at 9:22 PM Joe Damato <jdamato@fastly.com> wrote:
> > In commit 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the
> > future"), a bug was introduced causing the loop in ep_poll to hang under
> > certain circumstances.
> >
> > When the timeout is non-NULL and ep_schedule_timeout returns false, the
> > flag timed_out was not set to true. This causes a hang.
> >
> > Adjust the logic and set timed_out, if needed, fixing the original code.
> 
> Hi Joe,
> 
> we have been working on the fix at the same time, this is my fix:
> 
>  https://lore.kernel.org/linux-fsdevel/20250429185827.3564438-1-max.kellermann@ionos.com/T/#u
> 
> I think mine is better because it checks "eavail" before setting
> "timed_out", preserving the old behavior (before commit 0a65bc27bd64).
> Your version may set "timed_out" and thus does an unnecessary
> list_empty() call in the following block. (And maybe it can reset
> "evail" to false?)

I think it's up to the maintainers to decide which patch is
preferred; I don't really have a preference.
