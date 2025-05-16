Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E196214A60
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747358063; cv=none; b=TbmBAlSeC0g+l8WXBpCDkg4y4zKP7YfOYtm+QdzKkuGdMay0jRMtuCCy+O1tm3cF3TyZQO6/7Rfo0gekQ3RLEzDAs6PGQY+yuIyAeVtrVyxQIO8iVmzoACNKf+rh8em0RQwQDKIJax/b0pbSL3g0Q1EfWcvWwQA3qwhk+503s0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747358063; c=relaxed/simple;
	bh=VUd+ALkXjEUHrsEEy0a1rDVd+8FPx0NlAjh/ShtBrls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msQr/Juh2Gx/0WXFyE0wktOHv0rUu3mwPTLCa3SiZeU7+BB6O2BxXlae7bxkcuWnlPvmkr+aPt+G6HOXZ6DgK53g9kIhb3Rn0OleSLlpSGuBa0NdZ8FPomxYd/KUGXwvdCob+tgGhBKDTN0peGDKgGe4FcpU1DBqpE4YglnooLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=YPrKiY0C; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=0NmR6uNT; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="YPrKiY0C";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="0NmR6uNT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747358059;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VUd+ALkXjEUHrsEEy0a1rDVd+8FPx0NlAjh/ShtBrls=;
	b=YPrKiY0CLoWCAK8iiwzxPgmKZvIr8cTrY36+ONZEA59NY8CMeSqIcOZZ6gvVSTEB
	bILsmtmJnPSW6g27IiSsIQFZy15EN8RnJzBnFlJiJP69PRzIjtf/YZSax918AyjyilB
	mgYUGmpBTExUh/KnTZnmvdG9KQ3IoP3yK1KLE37nT7OGRFESLvnCMe+Uw+Q5oMI3Dv1
	9q/SVVnDZKiuHLp89tZ9fENpHaxuNowGFZ+DzVIAj9SRSs0dky72jApCWLpSHaJ21rF
	qxqa/9HgVKIQGOSxqPsH4rYmPY7kPbgAYzWpnd7FXL8zrJKplT0/AbsJmmlRCDO9wib
	JFQAvfETYw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747358059;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=VUd+ALkXjEUHrsEEy0a1rDVd+8FPx0NlAjh/ShtBrls=;
	b=0NmR6uNTcFoPjlOD5n8sjc36Z6wGIbR9+E7z0eMQ1+UJV9+T7wTQgwOxz5QsRQdh
	foytB/yu0T8QOQrHEoEh1Tpks5Eu9NZtzBuSi/II5QI/Hh6zOyH7Z9rrsopiztAgG11
	Zj04L4uU3YJlrOuSUg5KDksdOGuMZFjgdyhTFcxA=
X-Forwarded-Encrypted: i=1; AJvYcCXOlw2EDWunfLQvf+7gtKOP6/N8/Gh/EMMGqJKVRD/U+fv7fhaM2YpCmxJyPm9T/xujluhMX5zm1aeodeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfv/94AYXQ6JW6HpXqKwS5uGWQZPHN2LGwXWPfFX2HmLj01QS
	lU5sg+NP/pY0/5MVwMjqEWm6nQbleFtd4Dq3K0L0TnWcdN1SHO0vWmgVZ9iurw3ZdQVQB7rhTLW
	S3oWjYhh9Q9GYOF00Wnp/n8R6RvZWey8=
X-Google-Smtp-Source: AGHT+IGFxTYweNvp4VT3A9C0IdSu2acn1zl32ihrjG5FOzDgKxK/ZBImr/Ij0kEq54w7X4X0HcZOS9/KGvV+5ZDhm9A=
X-Received: by 2002:a17:902:f70e:b0:22e:4db0:6b2 with SMTP id
 d9443c01a7336-231d438a132mr16656415ad.9.1747358056752; Thu, 15 May 2025
 18:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
 <2025051301-projector-earlobe-9542@gregkh>
In-Reply-To: <2025051301-projector-earlobe-9542@gregkh>
From: Ozgur Kara <ozgur@goosey.org>
Date: Fri, 16 May 2025 01:14:19 +0000
X-Gmail-Original-Message-ID: <CADvZ6Eo+vBCCpygcoh2BRJwZzfK3bEUqyprX3RUxCAY1MjpOBg@mail.gmail.com>
X-Gm-Features: AX0GCFufAia8Y4u-CiYf_PQFqdt3f6c74Sjt3Xj2TPz1il-2Ss_PKQ7KTXUBc_A
Message-ID: <01100196d6a80a26-64ce1517-e29e-441c-b3e1-3c73f62a41ea-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Tanav Chinthapatla <tanavc01@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.16-23.251.240.7

Greg KH <gregkh@linuxfoundation.org>, 13 May 2025 Sal, 09:41 tarihinde
=C5=9Funu yazd=C4=B1:
>
> On Tue, May 13, 2025 at 01:53:20AM -0400, Tanav Chinthapatla wrote:
> > Hi,
> >
> > This patch fixes a checkpatch style issue in the rtl8723bs driver by
> > correcting spacing around a '+' operator.
> >
> > The patch is attached to this email.

Hello,

I dont think kernel developers will patch email additional files but
try this method.

Fix this file you are looking at with checkpatch.pl script,

then run add this file to your git repo command: git add file.c
and run a commit command: git commit -s -m "[PATCH] staging: x x"
finally, run patch command: git format-patch -1

in the end, it gives you a file called 0001-**.patch file and you can
literally email this file content here,
maybe if you look at the other patch emails sent they contain lines like

changed, insertions, deletions
foo
bar
end with diff version like for example 2.39.5.

Regards

Ozgur

>
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - Your patch was attached, please place it inline so that it can be
>   applied directly from the email message itself.
>
> - Your email was sent in HTML format, which is rejected by the mailing
>   lists and does not work for kernel development.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot
>
>
>
