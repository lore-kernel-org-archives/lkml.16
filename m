Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60651F3FEC;
	Thu, 24 Apr 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479520; cv=none; b=YVdtm8y3bReiThe7ZIg/KXA34Bz/m3tEiQIRmEb8tKLactsqDSJrqrO1btA4NlfFFn61f0Xesv1XgXwYka3oj/ImtL8rd7NzvC7u3RvAZP3E6epOuzaFGgvJNog+Zpi1abKDYp1RYNkKU7uemtb7FbLtGgR6wDG17KuwWnVsxR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479520; c=relaxed/simple;
	bh=NZ8+VZ5pN87uoWHge4oimbOjZrCQVP5U1teuaf28Yjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYbTX0cOt086qoC5Oo2ZBRuqyICRcQE+sZ9pnthjWWbdS7f6OgzaQb1FrVHxbQIvp526soyi7MnuZgYdRQxFYZf2rQgvP6Zpmol8ea1k0kgaFNa/f6ctm9bfHz6bJBYxdsxe2lbG9ZwbtVohrwTC0pINKbzc14BrCUp6IrInrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qniUusik; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qniUusik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F848C4CEE3;
	Thu, 24 Apr 2025 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745479518;
	bh=NZ8+VZ5pN87uoWHge4oimbOjZrCQVP5U1teuaf28Yjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qniUusik9OZC1dongdpj6fNxDPLr7sR0/on77prS5HiyH6xaNA4dwII8crMHYMw2T
	 oY7mDN4AH51imCuhlnyN4VsP8arXt4E8Bzgw/alaKeCsWprABhLXMsU6vuHaVECs0r
	 E9biTyfVLmOgQH72bM4769aGgFvpda2/Du3r3K/Ekc6fKPh84Mwsn04Vn2L05D5HaV
	 rUxPEE2xj9FbaMZT42xCj9QR98jaSIaMSk7K1T7mj6z9wW/vmmN1rPygT5eFZhTCTY
	 jg0pIxYlpuXTLSy2pLfyluLrPNIMYyBHHcbxZI8qCYAjn7JDv2Ov6WFdFC7KMG915g
	 BW5aWQFpPuhhw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7qxR-0000000013g-2zZV;
	Thu, 24 Apr 2025 09:25:18 +0200
Date: Thu, 24 Apr 2025 09:25:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexei Safin <a.safin@rosa.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: serial: ti_usb_3410_5052: Add NULL check for
 read_urb in ti_open()
Message-ID: <aAnnXQzzdqn-YXpC@hovoldconsulting.com>
References: <20250422205140.7857-1-a.safin@rosa.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422205140.7857-1-a.safin@rosa.ru>

On Tue, Apr 22, 2025 at 11:51:40PM +0300, Alexei Safin wrote:
> Avoid dereferencing port->read_urb when it is NULL, which may happen if
> usb_alloc_urb() fails or initialization of usb_serial_port is incomplete.
>
> Dereferencing a NULL pointer in ti_open() leads to a kernel crash.
> This condition was detected by a static analyzer, but can also occur
> in practice if memory allocation fails in probe path or if the driver
> is incorrectly initialized by a faulty device descriptor.

No, this can't happen as probe would abort on allocation failures and
the malicious descriptor case was fixed 8 years ago by commit
ef079936d3cd ("USB: serial: ti_usb_3410_5052: fix NULL-deref at open").

Johan
