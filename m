Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB485238C09;
	Sat, 31 May 2025 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679918; cv=none; b=UlNlv3HHKbe3yOhpNi/NhhgbQK2u9SH8QRU1qi5/x5o0Sy3pVA6s+fVVE8PxQtLb0yq5wh6Do6IizOJetmV85MjGKh/Aypvm1Vdl9qdcHbiuVv7XLLZB+LSqBiSlbAu4KrL2OCkaIlacW5fArelEupo3rSck2lg8oytdSMJW7AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679918; c=relaxed/simple;
	bh=rhHKUNdyzw5MLziyvEadGtZqK25u232WPPQdd6M7D0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jf/wW0chE/7XwKyy+3smgxNJeXaUw10YWzvP9JI+4vR3wpO2yXWHzXFyPbAi1yFzOo1YD42U+PNDafsqZW7lcilZwuQFyu9Rc8fuoN+hlNgTFmTQjgmGqLph/xMd1PvJxXSOJcxXOKa16yVc+VHT/x4ykL3f+/sa1cc3xxqbkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EQh7NMA/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EQh7NMA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C21C4CEF0;
	Sat, 31 May 2025 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748679918;
	bh=rhHKUNdyzw5MLziyvEadGtZqK25u232WPPQdd6M7D0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQh7NMA/eryeGDayMdjJOvBeWC36T79QjXZ0u5Zh8npFqf6GlhBwMCPKmIspkM0S8
	 7p/QsIZ/RjNZXBD2BJNrxfzSIaxD4VQ8rYAAsNTEZZAwRbWwPFSp8UzDgTqDNXG+Zt
	 jQZn7i7AKTj0mOOpK/vyszUcp2NuETxZj65R5NiI=
Date: Sat, 31 May 2025 10:25:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnd@arndb.de
Subject: Re: [PATCH 2/3] misc: add sysfs control driver for ST M24LR series
 RFID/NFC chips
Message-ID: <2025053149-karate-stooge-8bc1@gregkh>
References: <20250531081159.2007319-1-abd.masalkhi@gmail.com>
 <20250531081159.2007319-3-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531081159.2007319-3-abd.masalkhi@gmail.com>

On Sat, May 31, 2025 at 08:11:58AM +0000, Abd-Alrhman Masalkhi wrote:
> +	return scnprintf(buf, PAGE_SIZE, "%llx\n", val);

Please use sysfs_emit() for writing data out in sysfs show callbacks.

thanks,

greg k-h
