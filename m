Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1E2134A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565957; cv=none; b=tLysWF8MvNHVTy3/mCVlJal6+ElbEKIw3VNVP6gni/gtZbpdL+RQXHTasG57ZQa2o7k8uK2t0/mHMa3KOPLZrUgBQxqOTSJKufEr1KgZdlPpVztnDPAQluGyTom0ED92/y8lJyAn+qgvAnvTo30DxqSIu2pxhPLWli3RO0fcp/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565957; c=relaxed/simple;
	bh=gWw4+tx/Z6dHwfJVz3ptWAQkN4YYonKFNp6plN2PBsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxIIaHbkMB1jQ6jg2EnRxT06MsEH9Vb7VpnD0XJ9VRBgDI+dBEur3sF1gx2rg2VUZawPyETRWeghEjeDXhtwNrBQzktTPbxX6IHaeyDiOupiqKtO4v0GkHzRj8+7Dl/ol+Wucng0ljOvmbVTHh9Dn1fZCy9lI2EWz3GzXZqdAoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfexoPMm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfexoPMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B79C4CEE4;
	Fri, 25 Apr 2025 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745565956;
	bh=gWw4+tx/Z6dHwfJVz3ptWAQkN4YYonKFNp6plN2PBsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfexoPMmFJsrr1zsPEM6dlSGe4vv2RG2LM3T3uvAbo4W4VPxJCbGGe5CoAZFpFpQo
	 gRqO+2RhtNV6JJtrFd2SHBAInj0jbCrZeV7G+hFLOFsOwgm8CfTI6dajWBgXGc5nBy
	 RbCa5KYIYj2f0vaporrgysVK6I4Tx0QV6WqTLoI/fITUmeX9culx5C8TDP9fNgvSNq
	 BEHZMD90QO2glxFu++ZoA4tc9lGPWmf1gN6Su6LQ1GvlemNcPOZq7w8ZVIcdKZbLzw
	 DdN8Y4FT1invAG9OyMGF4ODz59eDCpl8oy+DRGVx4n6e4+sGvEa+B99HJfCNaiAAPk
	 IG5BR4ehT0nkg==
Date: Fri, 25 Apr 2025 00:25:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: objtool errors and warnings with clang-21
Message-ID: <syqx3hcoksstmadl7yimnwt6kueohkbvwfpoux2v5gsebalign@rq6lynvv5ppr>
References: <ed3bdbc7-63d0-4d9f-be2f-22fcdb52d32c@app.fastmail.com>
 <abzlhhff6zbzlehvc37f6thdprqlw4vu2zsvckjjbvlcomdmse@vxbsdxl555ne>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abzlhhff6zbzlehvc37f6thdprqlw4vu2zsvckjjbvlcomdmse@vxbsdxl555ne>

On Thu, Apr 24, 2025 at 02:18:25PM -0700, Josh Poimboeuf wrote:
> On Wed, Apr 23, 2025 at 04:25:54PM +0200, Arnd Bergmann wrote:
> > Here is a list of issues I currently see with linux-next and llvm-21 from
> > https://apt.llvm.org/bookworm, along with the .config files:
> > 
> > https://pastebin.com/mRxkgudJ 
> > drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0xe: unknown CFA base reg 0
> > make[8]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o] Error 255

This is KMSAN using a new register (%rax) for the DRAP prologue.  I have
a pending fix for this one which adds %rax support to ORC.

> > https://pastebin.com/7XEcstHP
> > drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17f: undefined stack state
> > drivers/input/misc/uinput.o: warning: objtool: uinput_str_to_user+0x17c: unknown CFA base reg -1
> > make[7]: *** [/home/arnd/arm-soc/scripts/Makefile.build:195: drivers/input/misc/uinput.o] Error 255
> > 
> > https://pastebin.com/6wAzkUL5
> > vmlinux.o: warning: objtool: ___bpf_prog_run+0x208: sibling call from callable instruction with modified stack frame
> > vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch+0xdb: call to __msan_memset() with UACCESS enabled
> > vmlinux.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf8: call to __msan_memset() with UACCESS enabled
> > 
> > https://pastebin.com/PQZDZV18
> > fs/fat/dir.o: warning: objtool: fat_ioctl_filldir+0x717: stack state mismatch: cfa1=4+168 cfa2=4+160

I haven't looked at these yet, but they also have KMSAN+UBSAN which
always manages to produce "interesting" code.

> > https://pastebin.com/StQRVCfQ
> > sound/soc/codecs/snd-soc-wcd9335.o: warning: objtool: wcd9335_slimbus_irq() falls through to next function __cfi_wcd9335_set_channel_map()

This is UBSAN inserting undefined behavior due to potential shift out of
bounds (negative shift) in wcd9335_slimbus_irq().  I have a pending fix
(convert i, j, and port_id to unsigned).

> > 
> > and a bunch more fallthrough warnings that are likely all related to that one:
> > 
> > drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.o: warning: objtool: dc_fixpt_recip() falls through to next function __cfi_dc_fixpt_sinc()
> > drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_catalog_ctrl_config_msa() falls through to next function msm_dp_catalog_ctrl_set_pattern_state_bit()
> > drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: bmi160_setup_irq() falls through to next function bmi160_data_rdy_trigger_set_state()
> > drivers/media/i2c/ccs/ccs-core.o: warning: objtool: ccs_set_selection() falls through to next function ccs_propagate()
> > sound/soc/codecs/aw88399.o: warning: objtool: aw_dev_dsp_update_cfg() falls through to next function aw_dev_get_int_status()

I haven't looked at these yet.  If other recent bugs are any indication,
these are likely caused by undefined behavior triggered by UBSAN and/or
KCOV.  Sometimes the bugs don't seem possible, sometimes they're real.
Either way it's a good idea to tweak the code to avoid the UB.

Usually they're something like a negative shift or divide-by-zero in the
given function.

I'm traveling this weekend, but I can look at these next week if you
send me the configs.  Or, if you want to take a look in the meantime,
the fixes may be fairly obvious if you look for potential UB.

-- 
Josh
