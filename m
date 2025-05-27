Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3E9193402;
	Tue, 27 May 2025 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748326193; cv=none; b=mhntWHqrdlDOfG1UtmqeYHkfRX8WrVFUbT4QHw0NfVkK0Xor8YxW//lR1zkpy8IqmyYv9I80UN09Gq9vU2oBzJfWwmwDbuBQAMvwru6VbHaFxtrEeIJi6oQADpUscbGcjEVzqBzY2wS9RTSSHWx7Q+zK4phjSpQTPVmptBJwmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748326193; c=relaxed/simple;
	bh=qOXDVrUaiO2l8wZl4UUJ7YeBOkFqYNSPmNtXngQ0I0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM86qY2NjEGNlC7i95n9Bw381AU0fo9YEf2dOF9qMHx1zEfRANYZAdUMvVquts8RibP5vgLg/fZZb+vJ3pnrrjO3wGIJC3yGRpNtg3g9oMInvc4vnyKSvPA5RrtSNZGW1h5+vutVFC9dDgO2klOAoXiVMl5u4OmRat94MDwjfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BWa0YSLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BWa0YSLn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC49CC4CEEA;
	Tue, 27 May 2025 06:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748326192;
	bh=qOXDVrUaiO2l8wZl4UUJ7YeBOkFqYNSPmNtXngQ0I0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWa0YSLnW7rqZQo1X6vmYMR9QzV3ZkmpIQRnOulB6lbtvOvbQjjfKPLIt3VHSLFTe
	 5XlzgQAwXbKqi1+ZdCPTHqTw4+LLEO9ZdedWn2/ojKLopt7W7rYwZYmAx880/7gH6K
	 HtV78t3jj8PJo8HVbahmsXe4xGPjVs+JUgs30MCo=
Date: Tue, 27 May 2025 08:09:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Cc: elder@kernel.org, keescook@chromium.org, johan@kernel.org,
	vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] greybus: Avoid fake flexible array for response data
Message-ID: <2025052727-goliath-freedom-102d@gregkh>
References: <20250527050635.946553-1-clf700383@gmail.com>
 <2025052700-ungodly-vitality-d86d@gregkh>
 <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>

On Tue, May 27, 2025 at 01:50:42PM +0800, clingfei wrote:
> Greg KH <gregkh@linuxfoundation.org> 于2025年5月27日周二 13:15写道：
> >
> > On Tue, May 27, 2025 at 01:06:35PM +0800, clingfei wrote:
> > > We want to get rid of zero size arrays and use flexible arrays instead.
> > > However, in this case the struct is just one flexible array of u8 which
> > > adds no value. Just use a pointer instead.
> >
> > Not true at all, sorry, it does "add value".  Please read the greybus
> > specification if you have questions about this.
> >
> > >
> > > v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/
> >
> > Please read our documentation for how to properly version kernel patches
> 
> Sorry, I will read it.
> >
> > >
> > > Signed-off-by: clingfei <clf700383@gmail.com>
> >
> > Also, we need a "full"name, not an email alias.
> >
> > > ---
> > >  drivers/staging/greybus/i2c.c             | 12 ++++--------
> > >  include/linux/greybus/greybus_protocols.h |  3 ---
> > >  2 files changed, 4 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> > > index 14f1ff6d448c..b248d6717b71 100644
> > > --- a/drivers/staging/greybus/i2c.c
> > > +++ b/drivers/staging/greybus/i2c.c
> > > @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
> > >  }
> > >
> > >  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
> > > -                                struct gb_i2c_transfer_response *response)
> > > +                                u8 *data)
> > >  {
> > >       struct i2c_msg *msg = msgs;
> > > -     u8 *data;
> > >       u32 i;
> > >
> > > -     if (!response)
> > > +     if (!data)
> > >               return;
> > > -     data = response->data;
> > > +
> > >       for (i = 0; i < msg_count; i++) {
> > >               if (msg->flags & I2C_M_RD) {
> > >                       memcpy(msg->buf, data, msg->len);
> > > @@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
> > >
> > >       ret = gb_operation_request_send_sync(operation);
> > >       if (!ret) {
> > > -             struct gb_i2c_transfer_response *response;
> > > -
> > > -             response = operation->response->payload;
> > > -             gb_i2c_decode_response(msgs, msg_count, response);
> > > +             gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
> > >               ret = msg_count;
> > >       } else if (!gb_i2c_expected_transfer_error(ret)) {
> > >               dev_err(dev, "transfer operation failed (%d)\n", ret);
> > > diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> > > index 820134b0105c..6a35c78b967b 100644
> > > --- a/include/linux/greybus/greybus_protocols.h
> > > +++ b/include/linux/greybus/greybus_protocols.h
> > > @@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
> > >       __le16                          op_count;
> > >       struct gb_i2c_transfer_op       ops[];          /* op_count of these */
> > >  } __packed;
> > > -struct gb_i2c_transfer_response {
> > > -     __u8                            data[0];        /* inbound data */
> > > -} __packed;
> >
> > As I said before, you can't just delete structures that are exported to
> > userspace without breaking things.  Why is this change acceptable to do
> > that?
> >
> > And how was any of this tested?
> >
> > greg k-h
> 
> Could you please give some examples that will be broken by this change?

Have you searched all userspace tools to verify that they do not use
this structure definition?  You are removing a user/kernel api here,
something that we do not do without researching that no existing user in
the world will not break.

> And I am not sure how this should be tested. It seems that it will not
> have any negative impact on functionality.

I would strongly recommend, that if you can not test this, that you not
make the change :)

good luck!

greg k-h
