Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3D2EF650
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171178; cv=none; b=Fftm+C3M3X45G3cm296cxmARmCP5JFoSHqOgOirmC+KgR29o9S9LxML6lYyaAZk7V1xImq+WtdcdQpS+iuKhjPrY7HtXT9X5RP8m2fRRk3FXI/BHKNwCOuiMFpatx/Z01+36nlBOguM31dIT0T27OtmuSKDero/wHrrrJpjexR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171178; c=relaxed/simple;
	bh=P0TmBh/SuinKvkwSU9wHk7cmF2i1xnwgWli/nKJV0Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8KYNa414FsPA4K6Nz1iBV/yK+NSzmGhSzdcg/veDVaKRSVwd/50PgifDBMGYlmzot+/voGZLDZt0+R0g9fGR6g1qO2dqDWFtXRUXo7xj+dm2dVrqr8x03Du4VSdCVUqYmjUmI2d2g1f+oYVQZEnHdGZV1XTiBms+xRO58BA7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0Bpn17g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0Bpn17g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750171175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPUJBR9Qf9kVxYZQYZ6+G9JwWB7GoNLWWQDEXWeJq2c=;
	b=K0Bpn17g8XHyCw+xecVGw0/m+ZrI+ITbX9yRSy7TLCaNbSAevL9+VI47R2zzYWA8Byovyn
	ZBZ+aEX8dzo/hBsp/IVLhsFR3cdcXmQvbw+ruzZeHeRKvo10OC4KaOz+DdtIBYHqMM+9Lt
	N3RgqYx0O9TbyD+KT3Pb+OdkoG8xUGc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-IYrBH1ewNl-haxfZ1VYLVg-1; Tue, 17 Jun 2025 10:39:32 -0400
X-MC-Unique: IYrBH1ewNl-haxfZ1VYLVg-1
X-Mimecast-MFC-AGG-ID: IYrBH1ewNl-haxfZ1VYLVg_1750171172
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso47536305e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171171; x=1750775971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPUJBR9Qf9kVxYZQYZ6+G9JwWB7GoNLWWQDEXWeJq2c=;
        b=EYWCVfOpFA9qxxMa11VdkqlUUOT3/xiFKZGgYCW65aLyt3SqZYufyyPfMdXtHRgOSF
         WmUXRGLj69lUEEk0aru8SxXGZ9/7CQUSXfl4Tu0JH3FJcS31FXTr3Kc/z8IJIAOGa0IH
         1N9qnGMwgMq3CYIczl6zgVXwUwv3fXopncTL6j2cvOLLAbevQJXgbBc6+ngPKL8xG+W/
         Zrgnc7NL//qcdt0noaho+jLTbWlYmFbKlefQsUUK4dHErPjAFmkc2hDerhO09QnXv28z
         WLuoNHO0KGZC8RzAkvwGIQOAcSca+1ztvF2fXliMdKbunScc8KiXGEpguXuWhfCt+EIf
         fDaA==
X-Forwarded-Encrypted: i=1; AJvYcCWodlWMasftWeqmbRAwWcxBG2DyRLT2lRrvFDLYg255z8c2Js1lBY+7HRdBJX5tEAScG26KIEceA8DodA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJozxsDCeDRiiSVLTIzmdWj9IvGGBJoFiCap9oQenGY5sTjlp
	30crTvMIIs6PZ06FkJyOhUMRxGSyn0SNN/r0BpOjh0XsW7XR0c+U2SY7gwmdlqFlpaNS+MqK+JO
	ikimoZQ0J3Y6MFQ+FWTv/XlOUH0GwJySCLWuMIDqc+Eaj2tCwK1ku1bueDwpNDCxlTQ==
X-Gm-Gg: ASbGncvdF77wpGMJF7//4JsZuzjtn4jday2SrGff1FuOu1T8aI5Et8vyM4YnMoWdaRd
	RyL7dFcpYQtx98g9/Gt1PHNl4hd4taAKaBoU6c3G3FCPE0me2O1Xa/5UX1YMn47WxTNiWxMXyCo
	JPDmTVb+3LFjIbXYlPJ2lRlV0d4F6GqP9Va7hE6h3swSO/pT+HoM1m/onw0U/Gn1wXeblbYvIoD
	PxwWtsdyFWHhrV76vXd3OBH3YtKLesLh0J/nal8uFJpMcGYLhZqWp8PvtmECnUm3lTvYac4/1SE
	UEQVXb123UfJ8OPbJhOn0b6AbMqR
X-Received: by 2002:a05:600d:13:b0:453:c39:d0c6 with SMTP id 5b1f17b1804b1-45344d8f6d6mr71096295e9.32.1750171171559;
        Tue, 17 Jun 2025 07:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNxFUr/RsjSCEdxIvQ1nYZxg2/GHtiJcbK0+y2FBpHGRW3fR6k2TfEm1PQ2vYeyp/yl4Cmrg==
X-Received: by 2002:a05:600d:13:b0:453:c39:d0c6 with SMTP id 5b1f17b1804b1-45344d8f6d6mr71095955e9.32.1750171171029;
        Tue, 17 Jun 2025 07:39:31 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.200.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e241b70sm175740145e9.18.2025.06.17.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:39:30 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:39:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, linux-hyperv@vger.kernel.org
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v3 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <y465uw5phymt3gbgdxsxlopeyhcbbherjri6b6etl64qhsc4ud@vc2c45mo5zxw>
References: <20250617045347.1233128-1-niuxuewei.nxw@antgroup.com>
 <20250617045347.1233128-2-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250617045347.1233128-2-niuxuewei.nxw@antgroup.com>

CCin hyper-v maintainers and list since I have a question about hyperv 
transport.

On Tue, Jun 17, 2025 at 12:53:44PM +0800, Xuewei Niu wrote:
>Add support for SIOCINQ ioctl, indicating the length of bytes unread in the
>socket. The value is obtained from `vsock_stream_has_data()`.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965..bae6b89bb5fb 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
> 	vsk = vsock_sk(sk);
>
> 	switch (cmd) {
>+	case SIOCINQ: {
>+		ssize_t n_bytes;
>+
>+		if (!vsk->transport) {
>+			ret = -EOPNOTSUPP;
>+			break;
>+		}
>+
>+		if (sock_type_connectible(sk->sk_type) &&
>+		    sk->sk_state == TCP_LISTEN) {
>+			ret = -EINVAL;
>+			break;
>+		}
>+
>+		n_bytes = vsock_stream_has_data(vsk);

Now looks better to me, I just checked transports: vmci and virtio/vhost 
returns what we want, but for hyperv we have:

	static s64 hvs_stream_has_data(struct vsock_sock *vsk)
	{
		struct hvsock *hvs = vsk->trans;
		s64 ret;

		if (hvs->recv_data_len > 0)
			return 1;

@Hyper-v maintainers: do you know why we don't return `recv_data_len`?
Do you think we can do that to support this new feature?

Thanks,
Stefano

>+		if (n_bytes < 0) {
>+			ret = n_bytes;
>+			break;
>+		}
>+		ret = put_user(n_bytes, arg);
>+		break;
>+	}
> 	case SIOCOUTQ: {
> 		ssize_t n_bytes;
>
>-- 
>2.34.1
>

