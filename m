Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FFC1C5D59;
	Thu,  8 May 2025 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697524; cv=none; b=MNgwRLPfb52iuNe5g0Bi+u/Ynmo2nPt31fgdfWONcajUfU64gZtsz19MgXM4EtiCJGiSyA2TTRUJALM7qVXjaw1+8twXx2JmVfJ/qbCe3wsTyQn4sWqqWMKuOkmL0EqhySh8LUtCWVxC3cTj2y7uF0+j+BhZkJP0zYSSd9UD1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697524; c=relaxed/simple;
	bh=OtBbZ26g2rNajWYoUamkRdqVOEmpJet2AEq0+kChBc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBwE3z36APR4rXZb6TEQxLehthn/bwDJqH5y8CqXI7TWQcbimN8Y9dmti22y19YSQHhPB4EStlUb8X8447p1qP3wOnBrwyoABvJef79e/ehoE5d4cRtOIc8XVofoL35qzRMmqFMqtS5HFYgRrZ0mJN+k6pSp9LF0UABSk/AADfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tJQEk/r2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tJQEk/r2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C889C4CEE7;
	Thu,  8 May 2025 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746697524;
	bh=OtBbZ26g2rNajWYoUamkRdqVOEmpJet2AEq0+kChBc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJQEk/r2+qd0PdPKQ3L7T31utZMvtPV0w2RPG/VBxzF2FhnFa39jhG6Vh5SRNZwVE
	 yUs4DtMpuvIt7xX8AXE1KCeYg6o2+dqgbkXyldfJgzWlxcEj55aSH1NdcQcV/ECZqb
	 baYJ+YjMQTbS9rHwe3yV6pQ4vjh9J87g2/GWYwsg=
Date: Thu, 8 May 2025 11:45:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: rafael@kernel.org, dakr@kernel.org, markgross@kernel.org, arnd@arndb.de,
	eric.piel@tremplin-utc.net, valentina.manea.m@gmail.com,
	shuah@kernel.org, i@zenithal.me, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH 1/2] driver core:add device's platform_data set for faux
 device
Message-ID: <2025050854-breeching-had-c9b3@gregkh>
References: <cover.1746662386.git.zhouzongmin@kylinos.cn>
 <b03b374bc3adad275893e2ad60d4bf5a0ad358e3.1746662386.git.zhouzongmin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b03b374bc3adad275893e2ad60d4bf5a0ad358e3.1746662386.git.zhouzongmin@kylinos.cn>

On Thu, May 08, 2025 at 05:11:47PM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Most drivers based on platform bus may have specific data
> for the device.And will get this specific data to use
> after device added.
> So keep the setting for device's platform_data is necessary
> for converting platform device to faux device.

I do not understand, why not just use the platform_data field directly
in the faux device structure?  Why change all callers to now have to
keep track of an additional pointer in these create functions?  That
just adds complexity for everyone when almost no one will need it.

thanks,

greg k-h
