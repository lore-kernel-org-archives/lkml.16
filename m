Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4721ADCB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529506; cv=none; b=XPQBdrx+e2nmKLSlbrD+hl8l7PPKme4xcHqGuvCARJoKoqE8/KLfHOJeKidtpLvyfIta/muFTVmwfxUuHMT+ViYsvU0rTu5Vpotjg+Gc+T8vMLNMGxc6GRkz6apScHRKj6AAzPKOgCrfQFrfNn0y2DxBvTLtwILxHc89K3NUiFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529506; c=relaxed/simple;
	bh=ZCr7E1hBko84Zm1LtXK1Y/D3SGRdjt1dLpKC/oePuaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0PCgACJvOAjIHU9BLT9l8i23UZMdQSMNKOWSqtDe3/gHkoypUH5UDeDn8PjCvJKpdZ3GZaK3g/Hb/rMYVDv+y7TFdf6t0wAble+pjQRI8pvePIt1kee9UDfYnet19z2BjnDVFLYfgEgmYsYZK3Li6u6VI0tynvXhoLOuqX68Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pahtorhD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pahtorhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6514BC4CEE4;
	Thu, 24 Apr 2025 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745529505;
	bh=ZCr7E1hBko84Zm1LtXK1Y/D3SGRdjt1dLpKC/oePuaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pahtorhD/VujyLZK/d9CCHJ/7dPxzk6KNv8PysmSjCoP3vEJSj5tW3xe9s32ckVMS
	 U6EfoiQoaBcgCxATYr0xLqPpaK4zbivrQkeqkIb0hu0kw6DeyKNp7WllpmowIxrgcQ
	 EDvgw2TpXKTugOGGwDxJ8jFwEhciaBB0BzGFUE9a8vVMFYN/GisufRyt/AbPgWA35V
	 EpJG6mabO0T2J9gDv1nZI0DdhIZqlV+QTFH3rrTt9ephRk/JOQ14m5UGHQaTChQNPW
	 i11GOXD2P/10mOyaisdpkROMpCjEAHaMUiNPVDjtDlf/WwdXVDa19zXZVCUkxtoEoB
	 M8FbCQSD8hbYw==
Date: Thu, 24 Apr 2025 14:18:23 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: objtool errors and warnings with clang-21
Message-ID: <abzlhhff6zbzlehvc37f6thdprqlw4vu2zsvckjjbvlcomdmse@vxbsdxl555ne>
References: <ed3bdbc7-63d0-4d9f-be2f-22fcdb52d32c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed3bdbc7-63d0-4d9f-be2f-22fcdb52d32c@app.fastmail.com>

On Wed, Apr 23, 2025 at 04:25:54PM +0200, Arnd Bergmann wrote:
> Here is a list of issues I currently see with linux-next and llvm-21 from
> https://apt.llvm.org/bookworm, along with the .config files:
> 
> https://pastebin.com/mRxkgudJ 
> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0xe: unknown CFA base reg 0
> make[8]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o] Error 255
> 
> https://pastebin.com/7XEcstHP
> drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17f: undefined stack state
> drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17c: unknown CFA base reg -1
> make[7]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/input/misc/uinput.o] Error 255
> 
> https://pastebin.com/6wAzkUL5
> vmlinux.o: warning: objtool: ___bpf_prog_run+0x208: sibling call from callable instruction with modified stack frame
> vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch+0xdb: call to __msan_memset() with UACCESS enabled
> vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf8: call to __msan_memset() with UACCESS enabled
> 
> https://pastebin.com/PQZDZV18
> fs/fat/dir.o: warning: objtool: fat_ioctl_filldir+0x717: stack state mismatch: cfa1=4+168 cfa2=4+160
> 
> https://pastebin.com/StQRVCfQ
> sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: wcd9335_slimbus_irq() falls through to next function __cfi_wcd9335_set_channel_map()
> 
> and a bunch more fallthrough warnings that are likely all related to that one:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function __cfi_dc_fixpt_sinc()
> drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_catalog_ctrl_config_msa() falls through to next function msm_dp_catalog_ctrl_set_pattern_state_bit()
> drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()
> drivers/media/i2c/ccs/ccs-core.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
> sound/soc/codecs/aw88399.o: warning: objtool: aw_dev_dsp_update_cfg() falls through to next function aw_dev_get_int_status()

Thanks!  Looking at these now.

-- 
Josh
