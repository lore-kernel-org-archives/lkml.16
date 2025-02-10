Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E466C264602;
	Mon, 10 Feb 2025 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223102; cv=none; b=VkARPfk6ele2q4EYS3UsYs8JzqT9B1EjwVm11T5tW6lAUKO539cxTk3r1oPMT7RYO0Y47gn0u2/HYdf9FJj1xg0NrpvzP1NQu42+mreR0WGc3zffSI7yvKI3uLHLbQbFpWGRET/+pJgiYgPJoitANqx/P9WVkRr0gvh62dEdudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223102; c=relaxed/simple;
	bh=H55zYY1xW7K/8lHb1pOf/mMu2U3y8HwUI8F2L9m5k+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLWA8Wg69l1eV1fwjfb7nGpv1G6m4xVwhakkbhBmuOP7cQXmR3mUCZs/wBgDtv5ip4tC7VHfYjRvG0rob+za4ZvQDVRM26UKSoS9oALa/xLRLHZjf2IcCAMOSl0ozZ4xKLmKWr0kXWy2RRO9xJ66/k5lIXfd/zx5fqQCL4+5Jhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGPMxurG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGPMxurG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A6CC4CED1;
	Mon, 10 Feb 2025 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739223101;
	bh=H55zYY1xW7K/8lHb1pOf/mMu2U3y8HwUI8F2L9m5k+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGPMxurGrQwMhH/WeZQi9Ba8kEWWeix8U3TAGBhJiTDW1SUg47ZHui3nQd6KxgfpQ
	 vDz9iN6kToTft+ujda717Q44PRXfd+8+AR+rdM9HTJIgRf0/NGOGU9SlEjs0G/oYrJ
	 VN+0ZF1c75W6T65+geEBL8l97Q0RtFTCa4WMClhIp0JJkJG4+5mfmYg5GJFIWeV+UG
	 jc1vSBZ2E+8rfiZIUgw0nCLgsTwpBxLHg2oGoZ7eZrkKHFnR9amY4MqxU489naoSd8
	 Rl6oBoZl2q0WyCzlNxIGa0RJDBFWpgCMzjnLihvVFuMELtBR7YsXmoWqlqBXdf8vZc
	 0xExpU9dytmoA==
Date: Mon, 10 Feb 2025 22:31:35 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4 2/9] rust/kernel: Add faux device bindings
Message-ID: <Z6pwN-S1tzAcpIbO@pollux>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-exert-accent-b4c6@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025021026-exert-accent-b4c6@gregkh>

On Mon, Feb 10, 2025 at 01:30:26PM +0100, Greg Kroah-Hartman wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This introduces a module for working with faux devices in rust, along with
> adding sample code to show how the API is used. Unlike other types of
> devices, we don't provide any hooks for device probe/removal - since these
> are optional for the faux API and are unnecessary in rust.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Maíra Canal <mairacanal@riseup.net>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
