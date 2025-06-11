Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE212F4317;
	Wed, 11 Jun 2025 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686103; cv=none; b=WifNoogZc196Rgg21sqPCOp+bX2wz4YRRFSz95fZNohqJ8YUtF6vz8hV0Y8Od+fK1sfObUrI+whqfXPyrdIY8doGiqXPZECaO36XWYbmIMTcgBt9QYn1Bovf8WcwZw8as+ylyVldz2cVLAFc6yzc4G3Dw4rbBK7vWVwspg1Nxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686103; c=relaxed/simple;
	bh=/QnapWZ6hd72QNEXGjdcEj4tgxV5UvbLT9znPYkUj4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QS1OE3g8Njn8GXzha3ut8Pm0oSWODvdM+eLkvwyIoRoFdG6GjiyPc4xqmuxPFZU+jIj0aOQh/D2/hVeo1tUqiyqsOhAwFHSuHRvDPFp3mWfvcxYNQ2Soa03+iUUw4/9i0+w9gE7WuU9fAgcvjTuPnjxCXj37aPuBDoW9rDcdV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP6K2m0o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP6K2m0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28D5C4CEE3;
	Wed, 11 Jun 2025 23:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749686102;
	bh=/QnapWZ6hd72QNEXGjdcEj4tgxV5UvbLT9znPYkUj4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OP6K2m0oGh7nHe0g/GuFm/j06JQkdoukX0SLlzw2+CXLfpYA2NmJ6+LAg19vRaw2C
	 o5Cz5P6QOt41qXkMh1qYvfMMPXXONJKM8JUaKDLOZd+NZt4YGgD8y/pqQGliF0kxmX
	 uR9i8fQysc956h5QAkQN7xGkOwFsGno6n86NtvHzK5EEGdejxyplBtIJSOTIK0Xfwj
	 MQBPfZlC6l+xY5uHTf9my67MS6RgnL+IBfZNuqoyviMnWYBXVqqFGufuDLDR/OWG8z
	 2Sy49G6jX+clwrSONE3gksejyg5i39C1WawOE9wn7MVIxfTX0IhkunpbEPUV3ITcEW
	 6o65luaS/VY9g==
Date: Wed, 11 Jun 2025 16:55:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev,
 jiri@resnulli.us, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, aleksandr.loktionov@intel.com,
 milena.olech@intel.com, corbet@lwn.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/3]  dpll: add all inputs phase offset
 monitor
Message-ID: <20250611165501.6c3730f4@kernel.org>
In-Reply-To: <20250610055338.1679463-1-arkadiusz.kubalewski@intel.com>
References: <20250610055338.1679463-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 07:53:35 +0200 Arkadiusz Kubalewski wrote:
> Add dpll device level feature: phase offset monitor.

Same story here
-- 
pw-bot: cr
