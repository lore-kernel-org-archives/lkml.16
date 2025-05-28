Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882362741D5;
	Wed, 28 May 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422266; cv=none; b=AAqSadmoFfP1eQ5tAxG4FGquzCRlpsZXQleKm6FC/FQlDRxwZoi/cFNKtsGzrH7RoKZUrJULwnAGIMMxZHvKkEbdGLbTtZsAITtCv22Pxmj5U86HteQgiahbKtg+FyHn5pRA5wd+8QzDr6OihrpnGb28hr2lmfArtws/C/dXNow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422266; c=relaxed/simple;
	bh=EgXIIRGlSGhAQOZPk7fOq6DPzV0ZVomQadDk0R5AnRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/cbWER7ORHLxOw3E8YmqYrg3TrxgoWPJZ4A3YXXqvrgOPKMwFZ7iEReJtkRgv8ecOaNIX63T6XIokPns0JHuGDlXdvgBS2nJddQp/gP7y2fcCVtQbdZ/eCTqV5Vtt4KQ2StYTjZstg3ebC7FN7ig04nx7xWFyqbE87IJPjGAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3LzV6U3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3LzV6U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013F7C4CEE7;
	Wed, 28 May 2025 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748422266;
	bh=EgXIIRGlSGhAQOZPk7fOq6DPzV0ZVomQadDk0R5AnRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3LzV6U3gyZMghCydLxdhwhcnKNqjEFY4KwOQAQK60hmPOAgQ2AOoBccMP1KBptNI
	 /tS6bv6n6ryuMt+6EGNEY7czlrJRjgiO1+68PF/cbLuLGntnVFv/a5rUeK8jQP4uSa
	 TfhO75RPbbDruEnM9wuAGoW+MhrcFB+UgeOlFN+RsHuvvvVQ3ygNpdrdGlZql19lG5
	 rHJEtPc6wkrShYEi4YwsNJ9eVkndFtZ1E9oHKcOE89vuCO3N6gpE+N1SIY8G4UpJvN
	 GUQGhqc4FQVfF+vbtfbpx6CYDU9m+pkoXc17Tdnz1YqSvIku04E+YRASe6c78p/F43
	 MCeOhwiw/VkNA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uKCVA-000000003AL-1ygP;
	Wed, 28 May 2025 10:51:09 +0200
Date: Wed, 28 May 2025 10:51:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Message-ID: <aDbOfKl3uiBYfBlp@hovoldconsulting.com>
References: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>

On Tue, May 27, 2025 at 09:26:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems to have been omitted during the initial bringup.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

NAK

This breaks suspend as I've mentioned multiple times in our meetings.
IIUC, this may even have been the reason why it was not included in the
first place.

Specifically, adding this interconnect triggers a reset by the
hypervisor on resume, presumably as something is not described properly
and depends on a vote not going away.

I have not had time to track it down, and I have even less time now, but
since you have access to the internal Qualcomm tools you may be able to
make some progress on this (e.g. by capturing and analysing a
crashdump).

Johan
