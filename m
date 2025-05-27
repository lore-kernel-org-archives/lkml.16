Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684113AD38;
	Tue, 27 May 2025 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375238; cv=none; b=fL0/Pt1SY2dr9MKOpT0XOJ/RnAII26UCGeRMVoqg8j9PiLOVGnA5g9WYlTjSKAVSUsz2J5LC1PvYyJk4iGl4N+eKdpX8ynObcB+U6MdS8P34k3F2eURK7bGMAALxCi98YjRhD5YnpTA0g/E5j+WCWrsCPLL/SbfM/mpwZjbOZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375238; c=relaxed/simple;
	bh=Z5/qghFsl8MH4crSpnbrGh2kAnMFXtWS1rnn+Ud0Nnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/Y0yeC0BJ0IUQNTH61C+my94duR3fogQqPU+67d2OHVZbDOdvthXf+oIghOSA4ussj27pyRcznUV8tl2lp4NYhLRlcfUyZwrb7SEgbwML3HjKhIQcPHXLwT8+sto5bQfv+uQ5JOKrUXJgSuDbFipUsihvvjjI6MWXvIY0d730c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jTuQd4Iu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jTuQd4Iu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sYaC13XAUT+Q0D8UVagUTeBPIkwVA5pPo5QAAwyWTuo=; b=jTuQd4IuQi3E/HohtnQIJ7lLSM
	UWSa4/T0NVrHFZoCFwlWX1lNMnTEdntHZz7k4uqDx0rYDJdRUEqmJZEUSoS7/ncIiaA5OcYNkjPM0
	6jbEmesiNoVhbk31fmSRgsrMJoc42yCn2HbWZyNB7MOzDofXpewI71yKqU+OjgSj57gw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uK0GB-00E6Xz-JD; Tue, 27 May 2025 21:46:51 +0200
Date: Tue, 27 May 2025 21:46:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>,
	Gur Stavi <gur.stavi@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH net] hinic3: Remove printed message during module init
Message-ID: <e206bfb4-a2b9-43b9-9dd4-f897a35569fc@lunn.ch>
References: <5310dac0b3ab4bd16dd8fb761566f12e73b38cab.1748357352.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5310dac0b3ab4bd16dd8fb761566f12e73b38cab.1748357352.git.geert+renesas@glider.be>

On Tue, May 27, 2025 at 09:33:41PM +0200, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> No driver should spam the kernel log when merely being loaded.
> 
> Fixes: 17fcb3dc12bbee8e ("hinic3: module initialization and tx/rx logic")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
