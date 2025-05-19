Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE22777E0;
	Mon, 19 May 2025 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657609; cv=none; b=hDVSnJtPkgiClStAa3wKlsxdiMntQBIo2PkDlcb5Ksy+vQzo6xIzL3w37fMgYnOyMFAJg9ME3ZBO6HfARFrgh9x6tPJ7jVVFB1KIZfBSClxzZxqckKF8CCjWgIsahV5h+esMazSkcBTs9X7kvRlkKWOV6EyyVzCSBKtC/TnhdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657609; c=relaxed/simple;
	bh=DPicR1+C76ccRqNyEUDpjoZuZjeKz6Q8YWTFHNuB6II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1dWqXdI41cNqvpKAg/q9zttJdGHyzUCC+4qVpTXacxrIEKaYbI9s6djyWHt6LARwDrWxvUj5KPzwsZPyyKrBwbSUFjKEiSzanN+R1e34L1gqQSLE3aRj99LZtHbbLq4o4lRfeGWda9jShbKXBj4i6IA6EipzSkrlorx0o9CQVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWQVXcgj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWQVXcgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A44EC4CEEF;
	Mon, 19 May 2025 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747657609;
	bh=DPicR1+C76ccRqNyEUDpjoZuZjeKz6Q8YWTFHNuB6II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWQVXcgj0MssGQ1+YRNson9Zo8ldCsHdJKJom7hRu6CLjJA0gS5bLWEK3tqOQz4DF
	 CfEjSVNbxPTcjaUXTu8OrSLduDqGElMXzc91CpNRst0GDO7Akh3HRCjcxX9uj9m7AG
	 0SoHIeMqdTnvgp3WAwncP42VB3U5lwG2rTXIP8QfZoq259ne0eINbb3NkoH/JUyJJq
	 zvns5lQajfqp2DTNPlHeXHlyOr0tvlvVmIaEu67xXsTC6TTbbyS3gZeugDcsazs2jn
	 jJD0SDOLZkhYD29D6inbcfeXhV1H0/VhCpNPDdkEaFY1ADh168m8NFzeXmsC74R985
	 hNeLotEFjHSmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uGzZs-000000006KG-1Pv8;
	Mon, 19 May 2025 14:26:44 +0200
Date: Mon, 19 May 2025 14:26:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/6] USB: serial: ftdi_sio: Code style cleanup
Message-ID: <aCsjhIbX5iT3ZALw@hovoldconsulting.com>
References: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>

On Mon, Apr 14, 2025 at 08:28:10PM +0000, Dominik Karol Piątkowski wrote:
> This series fixes spotted code style issues in ftdi_sio driver.

> Dominik Karol Piątkowski (6):
>   USB: serial: ftdi_sio: Remove space before comma
>   USB: serial: ftdi_sio: Add missing blank line after declarations
>   USB: serial: ftdi_sio: Remove superfluous space before statements
>   USB: serial: ftdi_sio: Fix indentation made with spaces
>   USB: serial: ftdi_sio: Fix misaligned block comment
>   USB: serial: ftdi_sio: Remove space before tabs

You should not be running checkpatch.pl (as you've clearly done here) on
code that's already in the kernel.

The exception is drivers/staging where patches like these are welcome so
that new contributers can practise on creating patches.

Johan
