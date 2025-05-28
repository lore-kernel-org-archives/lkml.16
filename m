Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034D28F934
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452742; cv=none; b=hX48sBBIzAwCMdYLqOLp63xFCxpkm75k4Ms+ktKbj8EBTe14gM9IqA9ipFMB0IGSsrzzM1AJwiU/O0sVr4SYn/b8Es08yC89I45AWrcLiWYGYhqsaDJhgLHDLXC4zZ1li5UR9YOqiaTObNqFhWiKdcLhSfIeiDKlMJP2TBWM4gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452742; c=relaxed/simple;
	bh=5wONOxlcPVB89ejRwl0IZk5FYyqCyMoTLQY1/nZZkw4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCb11waJlqiFR3lk5C0yh4HdGo8eD9vrpQLZxu+rJGR0QkCP8hVztMdx288v9ISvKZm65hnKDhUw7p6Ssf5Q0egbX0YDTge6ZGXxl/KWZNjEBqgByVkeNnDlKe0VQpdeeQYgFCNeHrS/XY5+U0H4nW1NjlQH0E1IsFW8oow1+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=jrLEkuTA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="jrLEkuTA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e331215dbso8578585ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1748452740; x=1749057540; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5wONOxlcPVB89ejRwl0IZk5FYyqCyMoTLQY1/nZZkw4=;
        b=jrLEkuTAHptcXpwZ72JCjzlzXM950pEfz3rZ06PneZYVUnSXNPNceyh5fUaINNzuju
         z1qSsDZKgQIxkFrjI3mZ0/VKRwL8nciuJcBcY0LE7+LDsiGeZ4c2+kMDyK67+3gT+V/L
         l4EF4Esc8BCZZXBG1HX4VYyyPUE70vYw/HvYZspRXjoW4gf5Mw9E0aLqOlPsNnIPqiae
         wtbD6X5/T1ucyveVt8V5hWBDLZksn7vw8OBaBXk/OBi1NFbvI1UJ+TWvXDojIFOzUeur
         3DtDcZAq5N2gBJunC0t5vdByTx5igLFSH+4+ByiLdEftnf6Mkc4mEe3lV+vu91TYMX6A
         7B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452740; x=1749057540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wONOxlcPVB89ejRwl0IZk5FYyqCyMoTLQY1/nZZkw4=;
        b=Q0fLUSjrMfX+wulhBkKNPqnj1cL8MuuZFEjJ0ezOIPYSkv6EodUWCPPiUSqKeME1Pd
         SiZG+/ivL6tLowX6GKFXTNyrmKiarctWjytWVh0fdtnq4qzcjGSqSw1vXlrlDILyAZ1S
         kjUjZo9N/3Zur8YJ6SfOxth39tR9yIWwXB9ABPjq3zBbyXlaiNCS5IOs669kCyx1G2u1
         A5sEiEwT+bM3HFBXZhaOvnA7gSDVVycBLKdt21mQb+xtmDqejPXhbt9eq8VjnKUtsPF6
         a1nTMrvUt25dVHzO77MKFzeiiVldNiMfzxlChsqkzog6pI29gO6TySCP0zNAbjx8bQQT
         gVKg==
X-Forwarded-Encrypted: i=1; AJvYcCXWyf1kKEE6HiRczMmF7GGreN3O4Roak8F8gJCa+Qgmvoa/7aekj1UAIBlXKtajY4y2va2CyvyMt8ufXJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVzn15XEAj7BQf1q3wWN9JaWfsb6QVFdXAOH7Bou5Nx4iFMjxC
	SVdXWlGjMqSTSDeyOZk2xz9kxTXbO0qunSlLEZCQlAoM5ued0oPwpOyebX2A7pWXOoY=
X-Gm-Gg: ASbGncvGgfM5Zh4PHG6RulFynjt6nztnv2wiEZLeJvYH19JtO7lv9Yj8GeI8vmzMond
	qNFT7SCSrxGo3wJ/INGLjqBtOuUz+DDzUZ5ix4Q/jjdiG5ld18gB448bhAkMynhzm0E1eJCM+/h
	vm7yQYb4fcHpygmIW7scc1KaVK1VrEwpcBVrmCOYqfPM3amShwj073fkzOCf10RsdkKUKEtP+NK
	godtXR/c5v+HFgpeYJ8UFLY654LRDfjkf76A5jM/kpg5odt57ZYiyboPL+8DWW95E4LhayrBMMa
	l+z+prYp8sDUlGBvi6a/rzVpD0AngWXv3S6zoJ7T9fjFdhRfV9HIGOmxXZqTllz1NxbGwSWdXKL
	Z7M8BvTqrTH0PQ2d+TUnoyRPdtv+R5R+KXg==
X-Google-Smtp-Source: AGHT+IETve6nGwydiyHHoFua3EtJKZhDro/giZ+ORdQ9amqqWms+gvlUaT5GMJovFKAeykn7oxDE3w==
X-Received: by 2002:a17:902:c94e:b0:234:986c:66cf with SMTP id d9443c01a7336-234f68e7c5dmr5380055ad.16.1748452739849;
        Wed, 28 May 2025 10:18:59 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:d337:7513:2b38:7a5b? ([2600:1700:6476:1430:d337:7513:2b38:7a5b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d3590f11sm14216585ad.142.2025.05.28.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:18:58 -0700 (PDT)
Message-ID: <6fd7a4ee0a9001d9cb0995719df5b88bcd56a870.camel@dubeyko.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?=
 =?UTF-8?Q?_=E5=9B=9E=E5=A4=8D=3A?= [PATCH] hfsplus: remove mutex_lock check
 in hfsplus_free_extents
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: =?UTF-8?Q?=E6=9D=8E=E6=89=AC=E9=9F=AC?= <frank.li@vivo.com>, 
 "glaubitz@physik.fu-berlin.de"	 <glaubitz@physik.fu-berlin.de>, Andrew
 Morton <akpm@linux-foundation.org>,  "Ernesto A."
 =?ISO-8859-1?Q?Fern=E1ndez?=	 <ernesto.mnd.fernandez@gmail.com>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, 
 "syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com"
	 <syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com>, 
 "Slava.Dubeyko@ibm.com"
	 <Slava.Dubeyko@ibm.com>
Date: Wed, 28 May 2025 10:18:57 -0700
In-Reply-To: <SEZPR06MB5269C1D405F40BD197989E89E867A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20250511110856.543944-1-frank.li@vivo.com>
		 <58e07322349210ea1c7bf0a23278087724e95dfd.camel@dubeyko.com>
		 <SEZPR06MB5269FA31FE21CD9799DA17ABE89AA@SEZPR06MB5269.apcprd06.prod.outlook.com>
	 <13f85ee0265f7a41ef99f151c9a4185f9d9ab0a0.camel@dubeyko.com>
	 <SEZPR06MB5269C1D405F40BD197989E89E867A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-05-28 at 17:01 +0000, =E6=9D=8E=E6=89=AC=E9=9F=AC wrote:
> Hi Slava,
>=20
> > Could you please rework the patch comment by means of adding
> > precise explanation of this?=C2=A0=20
>=20
> I don't quite get your point. Would you mind adding a comment or
> editing it here? : )=20
>=20

I see your point. We need accurately explain here that several threads
could try to lock the shared extents tree. And warning can be triggered
in one thread when another thread has locked the tree. This is the
wrong behavior of the code and we need to remove the warning.

This is what I meant here.

Thanks,
Slava.

