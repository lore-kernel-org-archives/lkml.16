Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415352116FE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327529; cv=none; b=X6iPctbJoSGzrv0n+axdX5yAF4cSlLN9BCRyhR4Uqgx3erkDHk8FsH7y7PZRIU1n/SCZsQ4lpZlhRNq+VKhkzAaBTY5o+9gH+yMMSDsf+cRnOrssCBKGU+fv9aDcBHZiSS1lOQIkYBj56HFYy90cxycmyKm4QEhHjYOaa6zuvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327529; c=relaxed/simple;
	bh=LKRwLe4hIjyx+WvEiREpzdrVkM01kskrX7paIeWtDmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPDMlr/pVMSyisUxPR6zTAdfIfKz1W31KsVwTgdDuO4AUovgy+q4ot8C087KVnak50e2WW6e9AdLnxtXEBZAXyCFmpYIUxBUEyb0XHy5lzpaZmWlmvZ91vaeHmEyaHnaAmBoqLDx3c8SQOzHuraaIp2ra1M5fkCJhbyctoRP1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31Gt-0004Kq-GI; Fri, 11 Apr 2025 01:25:23 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31Gt-004LL1-10;
	Fri, 11 Apr 2025 01:25:23 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u31Gt-00AVeH-0g;
	Fri, 11 Apr 2025 01:25:23 +0200
Date: Fri, 11 Apr 2025 01:25:23 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel@pengutronix.de,
	"vkoul@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] dmaengine: imx-sdma: sdma_remove minor cleanups
Message-ID: <20250410232523.yhpbwqyetfqdepc7@pengutronix.de>
References: <20250410232247.1434659-1-m.felsch@pengutronix.de>
 <20250410232247.1434659-3-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410232247.1434659-3-m.felsch@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-04-11, Marco Felsch wrote:
> We don't need to set the pdev driver data to NULL since the device will
> be freed anyways.
> 
> Also drop the tasklet_kill() since this is done by the virt-dma driver
> during the vchan_synchronize().

Please ignore this patch, I had issues with my mail setup.

Regards,
  Marco
