Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589731CF96;
	Fri,  6 Jun 2025 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212384; cv=none; b=WXVle73eL0y5pPvaAlr4v/IiZCNwgilW5SjBxio4EnycLgwszkZZ7rZn5GwLnhwo4H6M62I2Atu65V8b2YISo3D58duNdFhJEe6401rCiKTSGQYVnPTy3I8s71x+hF1Pu/CjacX3Q0HgM97hh/+bZyF2Hm+qE1S1yOV4BjSSUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212384; c=relaxed/simple;
	bh=xhiO+qFHPGHPlvqdzuWbCCP7owt+/xut051OtliEkYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeMRdaPCUw8IrPnT4r6wx7cseJGUAXzVLxFL1kkEB1GNfmV8Bi3upB/OhWqf1Uk79/soRdKAjRsbtodzTis5tSIO5O99DD4kKfdw8M5nKKBz2OfMNQgrm4pjBwqXkf9otsm4i8aSQvhmvqXTB+xO2G3ahpadKA7wf8RhyQ4TJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V2oKwrla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V2oKwrla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68075C4CEEB;
	Fri,  6 Jun 2025 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749212383;
	bh=xhiO+qFHPGHPlvqdzuWbCCP7owt+/xut051OtliEkYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2oKwrlaj5H/gMcS+fdhpXSpYFENGRjaoDmTAw5H1rXJMlXA03H+KwosPWypZdRhx
	 PBd60TsZwDky02JxEl1NtgSwbdB+p/a6cX+UtnoasqqL2Y/+X8rD57nmvZOHg0uRAB
	 Kdyvo1htsagLeAUGbGGvnUCXflVxwpO5h41iCQtk=
Date: Fri, 6 Jun 2025 14:19:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/3] misc: add driver for ST M24LR series RFID/NFC
 EEPROM chips
Message-ID: <2025060625-deviate-crummy-2633@gregkh>
References: <20250606120631.3140054-1-abd.masalkhi@gmail.com>
 <20250606120631.3140054-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120631.3140054-3-abd.masalkhi@gmail.com>

On Fri, Jun 06, 2025 at 12:06:30PM +0000, Abd-Alrhman Masalkhi wrote:
> adds support for STMicroelectronics M24LRxx devices, which expose
> two separate I2C addresses: one for system control and one for EEPROM
> access. The driver implements both a sysfs-based interface for control
> registers (e.g. UID, password authentication) and an nvmem provider
> for EEPROM access.
> 
> Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> ---
> Changes in v3:
>  - Fully support the M24LR chips, including EEPROM access, no need for
>    the standard at24 driver to handle EEPROM separately.

Why isn't this under drivers/misc/eeprom/ instead?

thanks,

greg k-h
