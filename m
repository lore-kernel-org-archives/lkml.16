Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A7205502;
	Tue,  4 Feb 2025 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661148; cv=none; b=leGZshF8XxKPqYvnfHhkaB6Dqt8Sd8SVtQruWhpiEpAo2o9hC/mg8nG0lpniwaxe1jMqWA1Q9ocGIDg44UpQlEzbAg1FcPkD45KrH68Iy1OrLjIwjhwURCB3vtgLgWMd8/FNBprBRWb386Zt50/i83OaRqaGMtxIOz2SlbkzXDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661148; c=relaxed/simple;
	bh=e7BXgZvYNO2Yfm1uDqi9dZspKT2AusgjGFCVrIZ/Y7g=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=usGYPX4Y3FHHAS0Y8pcXBAEyyVhh1JQvSTNJXnqH+N9M9Mf7tGx6PkNN3G30cCMVpNIgWEunkbPVaTfZN28Zqittk2y2WSlE5vebIkSUmza0QAjrK0cL0BymBqF+6cITXlUiG81TlJe02pnHdQGmbmYsyrzKvD+EPJIZ9dRYajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YnHwS3R9mz6D9b5;
	Tue,  4 Feb 2025 17:23:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7744C140B3C;
	Tue,  4 Feb 2025 17:25:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Feb
 2025 10:25:33 +0100
Date: Tue, 4 Feb 2025 09:25:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, Alexander Lobakin
	<aleksander.lobakin@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, "Mark
 Brown" <broonie@kernel.org>, =?ISO-8859-1?Q?Ma=EDra?= Canal
	<mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, Simona Vetter
	<simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <20250204092532.000001ca@huawei.com>
In-Reply-To: <2025020326-backer-vendetta-7094@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
	<2025020326-backer-vendetta-7094@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon,  3 Feb 2025 15:25:17 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nice. One trivial thing inline.


> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> new file mode 100644
> index 000000000000..0eba89a5cd57
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,189 @@


> +int __init faux_bus_init(void)
> +{
> +	int error;
> +
> +	error = device_register(&faux_bus_root);
> +	if (error) {
> +		put_device(&faux_bus_root);
> +		return error;
> +	}
> +
> +	error =  bus_register(&faux_bus_type);

Odd bonus space after = 

> +	if (error)
> +		device_unregister(&faux_bus_root);
> +
> +	return error;
> +}
