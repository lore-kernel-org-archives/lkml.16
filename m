Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4713AD3F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325058; cv=none; b=JahxbwxPrKwheJKRfv8qHHGIJIyaQN54qJ1o5gvz2Q4lXJyiwVbmxCBlkbI0jPVvZedLw7YGM31UDP720hMY8tcyygWG+oJnMiDg4ssuZREDX4qhgVP6mBVq/nFVqXqmUy7lCWh/afN0Rie8+ta3fMQ1JI3k5tlK6bAuXv7jGMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325058; c=relaxed/simple;
	bh=RwU/+QDQe8yqwBrSgSL3XAw4FaJHpNRGEU6zoX8Gg/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8d8SByvzdyaz43z/rcy6/00wcYm4iOANNFpQs+5lq8n7MlzR8FJPi9HLe0HUtUlFO9ak5aL7E9jkCMUX0UMHP8R406Jr+vfKtElNRO/JCbIMy6m5n37e07HgKOJRLYbiE6mpwuELJjhZho7Xv3/mcmsVhHqlBcDWJKAJfLjDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnV7yU+s; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnV7yU+s"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-604bf6052b1so288684a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748325055; x=1748929855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=GnV7yU+sNYbtySkpcll4NRWA2r87OBcVs+GkvQs01O3Gi2fq3B8inFEK0cYYO1TWMM
         uko5J1jQ8Pfre7WkpyDfxZN39jWjQKATJPWQtnSuUjSv6OjJRKjgzsHyfhJmUw1sCTfJ
         6fTX01zyNjUcLVqnOu7SafHczYk36VDHjaYs8zrT4A5wTnDIE2n71XfUTX9UY55ohWaU
         7PYczfazll2Y6KZz83nWiKHKFDxQbYqd31CANlbbOvdJ/85W8exFEMiFuZjFT7UHgSco
         YtuM7pjvSPuJYkpwG8NQPqxLMEAX7YETK/4ImRkyzETiXWbQuYH1TYL4D4LPAYxsNTIM
         rZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325055; x=1748929855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu9iSZ9Th/47Nb0jS9axxAY4+IRtONHz/7iK+0n6mDs=;
        b=QC+wRa9lQ3DecsOmfXPrAWfGHnTpPKDmsgNNg8mAYILzqwePLYhqSFQoaSBavKSXrw
         vZz2lUI0CyL1ZjxalrYr2ThfQXhRmJPdorrXB0OTkFuC/I6p8uOxoFtrMMYUISIK2DmA
         Fh7i0bOU1xHztdbTKwRlf2hWq5gvX4SLB9fjt31p4ZDHlO07QlvFHlQTjYnnxETKo9rV
         cq7eamZ2Nu5U0pDRLQ8XDuJZggsEi4GFsUtzxOlp0IC7D43PvCMWLbFGBGqLJO4QZYId
         veeWISKC/MVHae2KlwlW7gmV3Xj5xknAv6rF0qkBa6Wh6e3rHzN6W7c93SnSSKCKgVWr
         1sEg==
X-Forwarded-Encrypted: i=1; AJvYcCVaZzg1ZqfkSTRXkY7Wx7kNg3lhKwd85kByP8+5osPVPJtYDIMAUDzVzYO5Dzmu/febfcNtQUuKBsVuLIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9/jrnozbq9EAimkmh3bTvcZsK3TVt2dZlKcO5gSfNDFlmjYh
	duqJnIMQQUqhSI4lIbevph2QCcVKHG+flfL849lFAxUW0s7TbPLu8zF3N/C5fnPwe5bVx3lFGu0
	+2joeg4C4mNSluvdZPUpOJWXYq+dLsPs=
X-Gm-Gg: ASbGnctjT/3Om0hLWymU3UTu1dOJ1Wr2+0RzgY+lE5YCzZOmCqqK67n7FOz5TqL6N36
	8Q3uFJm3dluDnjtlxqoASnDPmW0F58EXZuhXOLASGsOySFfKBdt2WSs9Qr1MSVV6m9j6d4OCDDa
	5piVHJzi15l5UgBpyB3Rk20RbzzMniR3Xg+kEQswPRO1Q4i/yOoMKZxGk=
X-Google-Smtp-Source: AGHT+IF8oa3AYXfzFTrpxVaADoFu1eHHdn+1kSB5T16SwRD0pCGON9/yLRxNAAoUhNTp1RU1EfrPnYVf3KNvEcLuhv4=
X-Received: by 2002:aa7:cd16:0:b0:602:e002:f037 with SMTP id
 4fb4d7f45d1cf-602e0033b9bmr3024855a12.5.1748325054655; Mon, 26 May 2025
 22:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527050635.946553-1-clf700383@gmail.com> <2025052700-ungodly-vitality-d86d@gregkh>
In-Reply-To: <2025052700-ungodly-vitality-d86d@gregkh>
From: clingfei <clf700383@gmail.com>
Date: Tue, 27 May 2025 13:50:42 +0800
X-Gm-Features: AX0GCFvpY5pnbxrQ0do9awtnlP68ukFWbQpuKDLKiPXl2ghGljKA7usDYV2uW5w
Message-ID: <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
Subject: Re: [PATCH v2] greybus: Avoid fake flexible array for response data
To: Greg KH <gregkh@linuxfoundation.org>
Cc: elder@kernel.org, keescook@chromium.org, johan@kernel.org, 
	vireshk@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B45=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=8C 13:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 27, 2025 at 01:06:35PM +0800, clingfei wrote:
> > We want to get rid of zero size arrays and use flexible arrays instead.
> > However, in this case the struct is just one flexible array of u8 which
> > adds no value. Just use a pointer instead.
>
> Not true at all, sorry, it does "add value".  Please read the greybus
> specification if you have questions about this.
>
> >
> > v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/
>
> Please read our documentation for how to properly version kernel patches

Sorry, I will read it.
>
> >
> > Signed-off-by: clingfei <clf700383@gmail.com>
>
> Also, we need a "full"name, not an email alias.
>
> > ---
> >  drivers/staging/greybus/i2c.c             | 12 ++++--------
> >  include/linux/greybus/greybus_protocols.h |  3 ---
> >  2 files changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2=
c.c
> > index 14f1ff6d448c..b248d6717b71 100644
> > --- a/drivers/staging/greybus/i2c.c
> > +++ b/drivers/staging/greybus/i2c.c
> > @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *con=
nection,
> >  }
> >
> >  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count=
,
> > -                                struct gb_i2c_transfer_response *respo=
nse)
> > +                                u8 *data)
> >  {
> >       struct i2c_msg *msg =3D msgs;
> > -     u8 *data;
> >       u32 i;
> >
> > -     if (!response)
> > +     if (!data)
> >               return;
> > -     data =3D response->data;
> > +
> >       for (i =3D 0; i < msg_count; i++) {
> >               if (msg->flags & I2C_M_RD) {
> >                       memcpy(msg->buf, data, msg->len);
> > @@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c=
_device *gb_i2c_dev,
> >
> >       ret =3D gb_operation_request_send_sync(operation);
> >       if (!ret) {
> > -             struct gb_i2c_transfer_response *response;
> > -
> > -             response =3D operation->response->payload;
> > -             gb_i2c_decode_response(msgs, msg_count, response);
> > +             gb_i2c_decode_response(msgs, msg_count, operation->respon=
se->payload);
> >               ret =3D msg_count;
> >       } else if (!gb_i2c_expected_transfer_error(ret)) {
> >               dev_err(dev, "transfer operation failed (%d)\n", ret);
> > diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/=
greybus/greybus_protocols.h
> > index 820134b0105c..6a35c78b967b 100644
> > --- a/include/linux/greybus/greybus_protocols.h
> > +++ b/include/linux/greybus/greybus_protocols.h
> > @@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
> >       __le16                          op_count;
> >       struct gb_i2c_transfer_op       ops[];          /* op_count of th=
ese */
> >  } __packed;
> > -struct gb_i2c_transfer_response {
> > -     __u8                            data[0];        /* inbound data *=
/
> > -} __packed;
>
> As I said before, you can't just delete structures that are exported to
> userspace without breaking things.  Why is this change acceptable to do
> that?
>
> And how was any of this tested?
>
> greg k-h

Could you please give some examples that will be broken by this change?
And I am not sure how this should be tested. It seems that it will not
have any negative impact on functionality.
