Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDB1AAA32
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918691; cv=none; b=sIO6iVmnbCzOsEkvfeKmzRIDJ6qCyFizJpfjCgx7gFCEDQZUeK/1vhAOkjRc6uAvME6sU10QVjKkYZjznDjgIXZk301drS3oPmWegYlMotjqyaGDxnI1ui7qlJr0/gbO0jbDRal4XQV/8ZHJPMGNuv6s/XAah6dh/U6qmIyLmgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918691; c=relaxed/simple;
	bh=ntPoUNLsY0v8BEoaedR7Wdm6FKstT487pUXWDD+NDdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2MPARGeQjLUiyWNxbHW0asLA+paGEj7XOzulJ/hsitqx53bXmf5FNQg30itsFR/ZXdhKnAUts617tI6qS5qDR0ndwYrxzIfvuG/IFPUzAWPqY4aAEdplt5JBhZsa/aIZxHfmIvTTBmZqzeHMmDObrSCv5iB9huysNegnx9GHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oa/sb/PK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oa/sb/PK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99896C4CEE2;
	Fri,  7 Feb 2025 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918691;
	bh=ntPoUNLsY0v8BEoaedR7Wdm6FKstT487pUXWDD+NDdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oa/sb/PKaiaVdo1DVIfKxjTi3Qo+NY7MwNb/RlHk0pKU+x74ymCpprhu8MqIERsUM
	 LJXywcF9+odVMEXqYFkfm8PNNGgqRChelc1LnQbEWwCmq6+QGh1BYlKwB+7PC9S7mS
	 qrMBE1m0U+5yvE4dGA1bExeuNzqvYyVvwco1GV/Jk/ULCqDnNdJWmIl7VGoiwjlOBi
	 utVkg6aqkILgS9HBfovtc7QgWXz9DcRoUgCP0fB4BZIbhMYIk23oe8A6Z0wgHadRzh
	 d29nAmq/VQFWA5R4PX2wisccPW1hCOEz7q3RVXVYOaWJ6qyVb7FXbx4zNNRy4C6NKA
	 b8jChxwBhfhGw==
Date: Fri, 7 Feb 2025 08:58:07 +0000
From: Lee Jones <lee@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: max8997 cleanup bug?
Message-ID: <20250207085807.GE7593@google.com>
References: <Z6KxrcQz0JsQJ9nP@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6KxrcQz0JsQJ9nP@gallifrey>

On Wed, 05 Feb 2025, Dr. David Alan Gilbert wrote:

> Hi Lee,
>   I noticed that:
>    drivers/mfd/max8997-irq.c    max8997_irq_exit
> isn't called anywhere and was about to send a deadcode patch,
> but I'm thinking it's actually a bug and it should be called.
> 
>   Looking at the max8998, it has basically the same function,
> and it calls it from an error path in it's max8998_i2c_probe.
> There's no equivalent call in max8997's probe.
> 
>   To me it looks like it probably goes after the 'err_i2c_haptic:'
> label, but I don't know the code and as far as I know I don't
> have one of the devices.
> 
>   Any thoughts?

I would convert to devm_request_threaded_irq() and remove it.

-- 
Lee Jones [李琼斯]
