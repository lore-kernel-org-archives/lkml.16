Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2F2209F2E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787773; cv=none; b=qOQqREG6rmoromh1n4uj3SOL09H3hol0laT//JvgRYAOzXVDkUXKneXpZz3ysSuuYc49DntvXDk6scVMbJkbOxaSpvtMabrvGa3TwzCu/V87e1mg/zS4pFt2f2BcC5YL7GQO2mSHDDMIJzhuPzrIzMMp28Cu+I2CGSMGvlcq4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787773; c=relaxed/simple;
	bh=5f/iKFQSt2KeIDp+EV1K4kEUUEImeL1CQ44sRignQAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNW8uogQ16y59jnPhs/9y4VS55RkRK2HZkMQDBN2bVbzUdAUu5QRFWcvxnSRJaQOYtQeDIKEb62gYtiqTJAyLfFvqp5aqmhdnBtzyfPBk+9ODyxDNdw2BPCBQbTE0feK4CSMFH4uJNhb459mEVHKBPlcQCNC5O1HnIcgVK+Pnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC3gotgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC3gotgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733F2C4CEE8;
	Fri,  4 Apr 2025 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743787772;
	bh=5f/iKFQSt2KeIDp+EV1K4kEUUEImeL1CQ44sRignQAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC3gotgFeaNgBNMdoa6RLjjQchA3nwY1eaKq/6mjaDrQcIvuvMdhBTWzh1DIZ3Imt
	 HYI0yGB6yzEmewyEoSjWjEhA+sYT565NhsQV3C+5teyrObpVFsOsJIdlVFjcQT2lqx
	 9xOwl17FlCmOavHTQjJgeI2tfD858Dg/JHZm6QoQZ1cxZtG/po21KRKXhKwuSSANS9
	 jhIBoaq0acimH9obZSeu5rbaAFqBctYUWCZLCxllc7Eo5RGjtL0A2kDEenk2Ow8VgZ
	 OUPO599Z5fd7OyRFAIEujH98Tw17pvJul3VC2e3jUGjtnqo9sqfByyzGsbMKCWbt0T
	 Dl5yIQQFHHI4A==
Date: Fri, 4 Apr 2025 10:29:29 -0700
From: Kees Cook <kees@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init/Kconfig: conditionalize GCC10_NO_ARRAY_BOUNDS
Message-ID: <202504041028.6E6C6268@keescook>
References: <20250211221030.1815731-1-shyamsaini@linux.microsoft.com>
 <20250327183559.3339185-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327183559.3339185-1-shyamsaini@linux.microsoft.com>

On Thu, Mar 27, 2025 at 11:35:59AM -0700, Shyam Saini wrote:
> do you have any reviews for this patch?

It's a redundant change since CC_IS_GCC is checked later:

config GCC10_NO_ARRAY_BOUNDS
        def_bool y

config CC_NO_ARRAY_BOUNDS
        bool
        default y if CC_IS_GCC && GCC_VERSION >= 90000 && GCC10_NO_ARRAY_BOUNDS


If you wanted to make this change, then it would make sense to drop it
from CC_NO_ARRAY_BOUNDS at the same time.

-Kees

-- 
Kees Cook
