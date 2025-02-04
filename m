Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BC20CCC3;
	Tue,  4 Feb 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673275; cv=none; b=gcHzfSvrDZid7SV9aCqq4sakQBoMKt1tWusI7uHpDoTvP+CcrtwuXJQbrEt2IF9IOZE0X6t5gplBmTJPA7PxNRcusVIAEalbu1YnRQL74MbueWmxGoMl5ZdVyW06uqBipGXv0CdVFR+r2Pf3aonn8/CX46leWStUyjOAoqilPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673275; c=relaxed/simple;
	bh=+QuDPT6W5XirZNeR7SQ8jLXs2KGMTqlByEnYqxNXRuU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5dk/pydmJkOMqbAwO/6nqN0k+gUak2u17L6joPJrTQcLlHuwnPLdoVW2ML+AVEW22Owsit8+wUHYCSxiX9PAeKGWmxEQLFWiOOVt9KmVTuGDTLfDeBnbV4i4fFDBxaBHkBCzqZUBj/EMSwewCW/Lpgi9to3rZ43GwZV/X/uTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YnNPR28nFz6L4xl;
	Tue,  4 Feb 2025 20:45:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 658BC140A71;
	Tue,  4 Feb 2025 20:47:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Feb
 2025 13:47:49 +0100
Date: Tue, 4 Feb 2025 12:47:48 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, Alexander
 Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, "Mark
 Brown" <broonie@kernel.org>, =?ISO-8859-1?Q?Ma=EDra?= Canal
	<mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, Simona Vetter
	<simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>,
	<linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] regulator: dummy: convert to use the faux bus
Message-ID: <20250204124748.000072b6@huawei.com>
In-Reply-To: <2025020424-shuffle-facedown-973f@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
	<2025020424-shuffle-facedown-973f@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue,  4 Feb 2025 12:09:14 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> The dummy regulator driver does not need to create a platform device, it
> only did so because it was simple to do.  Change it over to use the
> faux bus instead as this is NOT a real platform device, and it makes
> the code even smaller than before.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Looks good.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
