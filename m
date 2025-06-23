Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7371A42C4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701921; cv=none; b=BPiLUIWiZ94s0WFAisHHr8qXKdDMQNT8DFeF+Jqn4ae+msfldXzc3nFXuHKILNo3CWX1v5oBibHWXAsE/mS8zplsws4g0g0vUk7Y+BSJN4YxoZMMGUoZlvIvxDfS6rrjB4LIE+JR+PlTFgayleP1XQ8AGvY09wmUu7uKZFRXN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701921; c=relaxed/simple;
	bh=/Bu/bsunL9s4BIsZZ9PAXT2x9HKdmh2ncam0X4BvYHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UosAPgDFA/0ltQbgI9GwhlUKA1WUDrATm9gADDqvLVJ+kzLCs0IKFaTpnMtQk2gwJeT9M1YpfEZmWzhKv1H7GDbE0n7SqBQMWTfRf3ehqEmd+et/WGHVfFMHG40xJhymrR7lUkW9RDL/vEWMdFv7Nexh6oca77CpNvx6PGfhEX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=cbbM+8D/; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="cbbM+8D/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750701913;
 bh=uilE6HfoONKcwjQl3lsLQM5Nt8SZOoXAj5Yv5RvTGoM=;
 b=cbbM+8D/dtAQXz+dnpXJkDoXhKcCOKkher+Vh8rcrc+mXboKxbr+E0ugM1LkmUiPqcrY2xIzJ
 szzfE2/dzQAgzeHXdWdbB2Vxly40t1yLp9kTfDlvdlEjk+wrhTeB3BK/xuUgnB1jSAeZvz39ASV
 VAFwnZ1i5fCtYyavmRArFbYEPoMI7boFivh/P+UwGdi2yxvROvFGMMcm72mr7v86d+/Ds63AQ+1
 n/pblsUbPCLBHhPUc5Wf0U7pu+Zz3hC9sqqWvPAGgEWUIkaiUrR+TtYPiXCZaGX8V933t9OEEFH
 uS3XQcTNV6XYhehxGGSk+6GPZ1GWVWil/wlh1rAJ9cTA==
X-Forward-Email-ID: 6859974e294ea86d0db5f82b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <647270be-832c-470b-832c-faf16f23f41a@kwiboo.se>
Date: Mon, 23 Jun 2025 20:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
To: Alexey Charkov <alchark@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
 <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-06-23 15:58, Alexey Charkov wrote:
> On Mon, Jun 23, 2025 at 1:19 PM Alexey Charkov <alchark@gmail.com> wrote:
>>
>> On Sun, Jun 22, 2025 at 5:48 PM Heiko Stuebner <heiko@sntech.de> wrote:
>>>
>>> Am Samstag, 21. Juni 2025, 23:21:11 Mitteleuropäische Sommerzeit schrieb Alexey Charkov:
>>>> On Sat, Jun 21, 2025 at 11:44 PM Heiko Stuebner <heiko@sntech.de> wrote:
>>>>>
>>>>> Am Samstag, 21. Juni 2025, 21:35:56 Mitteleuropäische Sommerzeit schrieb Alexey Charkov:
>>>>>> On Fri, Jun 20, 2025 at 8:02 PM Alexey Charkov <alchark@gmail.com> wrote:
>>>>>>>
>>>>>>> On Wed, Jun 18, 2025 at 6:48 PM Alexey Charkov <alchark@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Wed, Jun 18, 2025 at 6:06 PM Nicolas Frattaroli
>>>>>>>> <nicolas.frattaroli@collabora.com> wrote:
>>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> +Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenanigans by now,
>>>>>>>>>
>>>>>>>>> On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey Charkov wrote:
>>>>>>>>>> On Sun, Jun 15, 2025 at 8:00 PM Piotr Oniszczuk
>>>>>>>>>> <piotr.oniszczuk@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Wiadomość napisana przez Alexey Charkov <alchark@gmail.com> w dniu 9 cze 2025, o godz. 16:05:
>>>>>>>>>>>>
>>>>>>>>>>>> On Sun, Jun 8, 2025 at 11:24 AM Piotr Oniszczuk
>>>>>>>>>>>> <piotr.oniszczuk@gmail.com> wrote:
>>>>>>>>>>>>>> Wiadomość napisana przez Alexey Charkov <alchark@gmail.com> w dniu 5 cze 2025, o godz. 15:42:
>>>>>>>>>>>>>>> Alexey,
>>>>>>>>>>>>>>> I see you are using rk3576 board like me (nanopi-m5)
>>>>>>>>>>>>>>> Have you on your board correctly working cpu dvfs?
>>>>>>>>>>>>>>> I mean: [1][desired clocks reported by kernel sysfs are in pair with [2[]cur clocks?
>>>>>>>>>>>>>>> In my case i see mine cpu lives totally on it’s own with dvfs:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hi Piotr,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I haven't tried to validate actual running frequencies vs. requested
>>>>>>>>>>>>>> frequencies, but subjective performance and power consumption seem to
>>>>>>>>>>>>>> be in line with what I expect.
>>>>>>>>>>>>>
>>>>>>>>>>>>> well - my subjective l&f is that  - currently - my rk3576 seems „slower" than i.e. 4xA53 h618.
>>>>>>>>>>>>
>>>>>>>>>>>> In my experience, native compilation of GCC 14 using 8 threads on
>>>>>>>>>>>> RK3576 (mainline with passive cooling and throttling enabled): 2 hours
>>>>>>>>>>>> 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
>>>>>>>>>>>> case and throttling enabled but never kicking in): 1 hour 10 minutes
>>>>>>>>>>>
>>>>>>>>>>> by curiosity i looked randomly on 3576 vs 3588:
>>>>>>>>>>> multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=Rockchip+RK3576&id=6213
>>>>>>>>>>> multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=Rockchip+RK3588&id=4906
>>>>>>>>>>>
>>>>>>>>>>> assuming 3588 as baseline, 3576 is approx 20% slower on multithread passmark (has ~0,8 comp power of 3588)
>>>>>>>>>>> 70 min compile on 3588 should take something like ~86min on 3576.
>>>>>>>>>>> In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of 3588.
>>>>>>>>>>> Roughly 3576 should do this task in 40min less than you currently see i think
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> Can't see how u-boot would affect CPU speed in Linux, as long as you
>>>>>>>>>>>> use comparable ATF images. Do you use the same kernel and dtb in all
>>>>>>>>>>>> these cases? Also, what's your thermal setup?
>>>>>>>>>>>
>>>>>>>>>>> yes. in all cases only change was: uboot & atf
>>>>>>>>>>> thermal is based on recent collabora series (+ recent pooling fix for clocks return from throttling)
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Not sure UX is a particularly good measure of CPU performance, as long
>>>>>>>>>>>> as you've got a properly accelerated DRM graphics pipeline. More
>>>>>>>>>>>> likely 2D/3D and memory.
>>>>>>>>>>>
>>>>>>>>>>> indeed.
>>>>>>>>>>> For quantified look i’m looking on v.simple approach to estimate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
>>>>>>>>>>> by curiosity i looked what it reports on a53/a55/a72/a76 and it is surprisingly accurate :-)
>>>>>>>>>>> on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in perf. gov it seems to be constant)
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> There might be some difference in how PVTPLL behaves on RK3576 vs.
>>>>>>>>>>>> RK3588. But frankly first I would check if you are using comparable
>>>>>>>>>>>> ATF implementations (e.g. upstream TF-A in both cases), kernels and
>>>>>>>>>>>> thermal environment :)
>>>>>>>>>>>
>>>>>>>>>>> all tests: the same 6.15.2 mainline + some collabora patches
>>>>>>>>>>>
>>>>>>>>>>> diffs were:
>>>>>>>>>>> 1.collabora uboot[1] + mainline atf 2.13
>>>>>>>>>>> 2.collabora uboot[1] + rockchip rkbin bl31 blob
>>>>>>>>>>> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>>>>>>>>>>>
>>>>>>>>>>> on 1/2 i see kind of issue with clock values (i.e. perf gov gives constant 800MHz on mainline atf).
>>>>>>>>>>> 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all is snappier/faster)
>>>>>>>>>>
>>>>>>>>>> There is indeed something weird going on. I've tried running sbc-bench
>>>>>>>>>> [1], and even though I observe dynamically varying CPU frequencies
>>>>>>>>>> after boot with schedutil governor, once sbc-bench switches the
>>>>>>>>>> governor to "performance" and goes through the OPPs in descending
>>>>>>>>>> frequency order, the CPUs seem to get stuck at the last applied low
>>>>>>>>>> frequency. Even after max frequency gets reverted from 408 MHz to
>>>>>>>>>> something higher, even after I switch the governor to something else -
>>>>>>>>>> no matter what. Only a reboot gets the higher frequencies 'unstuck'
>>>>>>>>>> for me.
>>>>>>>>>>
>>>>>>>>>> These are all observed at around 55C SoC temperature, so throttling is
>>>>>>>>>> not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
>>>>>>>>>> that the 408 MHz OPP requires (and power readings seem to match: I'm
>>>>>>>>>> getting about 2.3W consumption at 408 MHz in idle vs. normal idle
>>>>>>>>>> reading of 1.4W at around 1 GHz).
>>>>>>>>>>
>>>>>>>>>> Not sure what's going on here, and I don't remember seeing anything
>>>>>>>>>> similar on RK3588. Thoughts welcome.
>>>>>>>>>
>>>>>>>>> This may once again be a "accidentally uses wrong clock IDs" type
>>>>>>>>> situation. The other possibility is that we're getting confused
>>>>>>>>> between what we think the clock rate is and what SCMI actually set
>>>>>>>>> the clock rate to.
>>>>>>>>>
>>>>>>>>> Things to check is whether the right clock controller (scmi vs cru)
>>>>>>>>> and the right clock id (check ATF source for this) is used.
>>>>>>>>
>>>>>>>> Clock IDs in the kernel seem to match those in ATF, but I've noticed
>>>>>>>> what appears to be a buffer overflow in some of the SCMI clock names
>>>>>>>> defined in the opensource TF-A (thanks GCC 15 and its zealous
>>>>>>>> warnings):
>>>>>>>
>>>>>>> After some more testing, I tend to confirm what Piotr observed
>>>>>>> earlier. Namely, frequency scaling acts weird on any ATF version (be
>>>>>>> it binary BL31 or opensource TF-A), as long as mainline u-boot is
>>>>>>> used. Using the u-boot binary extracted from the ArmSoM QWRT image
>>>>>>> does not lead to "stuck" CPU frequencies when running sbc-bench.
>>>>>>>
>>>>>>> I'm getting this with the exact same kernel build (6.16-rc1 with some
>>>>>>> Sige5 related patches, namely v2 of this series, Nicolas' USB
>>>>>>> enablement series and TSADC). The only other difference is that the
>>>>>>> binary u-boot doesn't have EFI support, so I had to boot into the
>>>>>>> ARM64 uncompressed Image instead of vmlinuz.efi, but those were both
>>>>>>> taken from the same build.
>>>>>>>
>>>>>>> What I'm observing during the sbc-bench run:
>>>>>>>  - It switches the cpufreq governor from schedutil to performance
>>>>>>>  - It goes through all CPU OPPs in descending frequency order
>>>>>>>  --- While it does that when booted using mainline u-boot +
>>>>>>> vmlinuz.efi: "hardware limits" line in "cpupower -c 0,4
>>>>>>> frequency-info" changes with each OPP change (the max frequency
>>>>>>> getting reduced sequentially), then it resets to the initial full
>>>>>>> range, but the actual frequency stays stuck at the lowest possible
>>>>>>> value
>>>>>>>  --- While it does that when booted using binary u-boot + Image:
>>>>>>> "hardware limits" line in "cpupower -c 0,4 frequency-info" doesn't
>>>>>>> change, but the actual frequency gets reduced sequentially. Then after
>>>>>>> the iteration over all OPPs is completed it returns to the highest
>>>>>>> possible value, and adjusts dynamically based on thermal throttling as
>>>>>>> the benchmark progresses
>>>>>>
>>>>>> Slight correction: it's not the "hardware limits" line, but rather
>>>>>> "current policy".
>>>>>>
>>>>>> Note that booting mainline u-boot in non-EFI mode (using plain Image)
>>>>>> doesn't change the results above.
>>>>>
>>>>> I'm in a similar boat, while trying to make DSI run on the rk3576.
>>>>> Andy from Rockchip was able to make it work "just" by using vendor-
>>>>> firmware - while using mainline u-boot (with both mainline TF-A
>>>>> or vendor TF-A) produces just black output.
>>>>>
>>>>> I think when I did the mainline u-boot thing I took the "vendor"-code
>>>>> from the armbian rk3576 vendor-u-boot ... but that actually may differ
>>>>> from what the vendors provided?
>>>>
>>>> Just tried booting into u-boot built from ArmSoM sources at [1] - same
>>>> issues as using mainline. Either I'm doing something stupid building
>>>> it (don't know what though), or the binary shipped in ArmSoM images is
>>>> indeed different from what the sources are.
>>>
>>> Can you list the versions you see for the _working_ binaries?
>>
>> Those are not as detailed as I'd like, as vendor builds seem to
>> override the default U-boot versioning rules (stripping the git hash
>> information off).
>>
>> I've identified the following versions for the binary image that worked for me:
>>
>> DDR init v1.03 (version string "DDR 81dd75088a wesley.yao
>> 24/04/16-11:19:41,fwver: v1.03")
>> U-boot SPL 2017.09 (no traces of any particular git commit, version
>> string "U-Boot SPL 2017.09 (Aug 23 2024 - 00:47:39)")
>> U-boot proper 2017.09 (ditto, version string "U-Boot 2017.09 (Aug 23
>> 2024 - 00:47:39 +0000) OpenWrt")
>> BL31 image v1.04 (version string
>> "v2.3():v2.3-749-g30018b771:derrick.huang, fwver: v1.04")
>> BL32 image v1.01 (version string "U3.13.0-791-g185dc3c92 #hisping.lin
>> (gcc version 10.2.1 20201103 (GNU Toolchain for the A-profile
>> Architecture 10.2-2020.11 (arm-10.16))) #2 Tue Apr 16 11:05:25 CST
>> 2024 aarch64, fwver: v1.01")
>>
>>> I.e. u-boot and friends may list someversion-gGITHASH thingy like your
>>> OPTEE already does: OP-TEE version: 3.13.0-791-g185dc3c92 .
>>> Also possibly the build date.
>>
>> The build date is later than any commit I see in the ArmSoM repo
>> leading up to either of the two tags they have there ("rk3576" and
>> "rk3576-6.1-rk3.1", neither of them belonging to any published branch
>> there)
>>
>>> I.e. I'm wondering/hoping if we can match to some git commit.
>>
>> I've also noticed that ArmSoM SDK references the "boost" binary from
>> rkbin (rk3576_boost_v1.00.bin in particular), but it doesn't seem to
>> be present in the bootloader binary I'm looking at. The version string
>> of the SPL binary in rkbin as included in the SDK is also different
>> from what I'm seeing in the actual binary: SDK has "U-Boot SPL
>> 2017.09-g57b8ceed1c3-240418 #lxh (Apr 19 2024 - 17:07:22), fwver:
>> v1.02".
>>
>> I'll try and rebuild the vendor u-boot from source with these specific
>> versions of rkbin blobs (ddr v1.03, bl31 v1.04 and bl32 v1.01), but
>> the changelog in rkbin didn't mention anything that would seem
>> relevant to the issue I'm observing :(
> 
> Okay, I've bisected this.
> 
> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> v1.08 and earlier work fine. Tested with vendor u-boot and with
> 2025.07-rc2, results are similar. OP-TEE presence does not affect the
> results.
> 
> To test:
> 1. Build and apply a fresh u-boot-rockchip.bin using the DDR init and
> BL31 from rkbin repo [1]
> 2. Run "watch cpupower -c 0,4 frequency-info" to observe how CPU
> frequencies change
> 3. In a separate terminal, run "bash sbc-bench.sh -c" [2]
> 4. "Good" behavior:
>     a. Once the cpufreq governor is switched to "performance" (if it
> was anything different at boot), both CPU clusters go up to their max
> frequencies
>     b. While the benchmark runs through the stage where it says
> "Checking cpufreq OPP", CPU frequencies consecutively decrease from
> the max OPP frequency to the min
>     c. After the benchmark finishes the stage where it says "Checking
> cpufreq OPP", both CPU clusters go up to their max frequencies for the
> rest of the benchmarking run
>     "Bad" behavior:
>     a. Once the cpufreq governor is switched to "performance" (if it
> was anything different at boot), both CPU clusters stay at whatever
> frequencies they were at when the switch occurred
>     b. While the benchmark runs through the stage where it says
> "Checking cpufreq OPP", CPU frequencies consecutively decrease from
> the "pre-max" OPP frequency to the min (max frequency never gets
> applied on either of the clusters!)
>     c. After the benchmark finishes the stage where it says "Checking
> cpufreq OPP", both CPU clusters stay at their min frequencies for the
> rest of the benchmarking run
> 
> I suspect it has something to do with the topmost OPP somehow becoming
> unselectable in ATF starting from binary BL31 v1.09 (and similarly in
> opensource TF-A). This time I couldn't reproduce the "permanently
> stuck" CPU frequencies though.

Open-source TF-A only seem to support rates up to 2208 MHz for cpub and
2016 MHz for cpul, see [3]. The opp-2304000000 should probably be
removed from rk3576.dtsi.

All rates starting from 816 MHz are expected to use the PVTPLL, i.e. the
configured osc ring length (by tf-a) and opp voltage (linux) will
regulate the rate. The measured rate can typically also be read from a
PVTPLL grf reg (0x18).

For the GPU clock I have an incoming series that switch to use GPU
PVTPLL instead of a normal PLL, see [4].

[3] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/rockchip/rk3576/scmi/rk3576_clk.c#L264-L304
[4] https://github.com/Kwiboo/linux-rockchip/commits/next-20250428-rk35xx-scmi-gpu-clk/

Regards,
Jonas

> 
> Here are the git bisect results (running in rkbin repo):
> 
> 0b338fd6ae7ad816295a75c80b00968bb1868625 is the first bad commit
> commit 0b338fd6ae7ad816295a75c80b00968bb1868625 (HEAD)
> Author: XiaoDong Huang <derrick.huang@rock-chips.com>
> Date:   Fri Jun 28 17:47:55 2024 +0800
> 
>     rk3576: bl31: update version to v1.09
> 
>     Build from ATF commit:
>         286c013b2 plat: rockchip: rk3576: Add support to set low length
>     update feature:
>         286c013b2 plat: rockchip: rk3576: Add support to set low length
>         5fb78cd64 rockchip: uart: switch to loopback mode before
> checking busy status
>         02ff3b0da rockchip: uart: save uart register once
>         23bd4684e plat: rk3576: support to switch hptimer to 1G
>         b4833e988 plat: rk3576: remove AUTOCS_EN_COUNT
>         437ed59cb plat: rockchip: rk3576: support aclk_sencure_s enable
>         6d8c67d6a plat: rk3576: support poweroff scu1 when cpu4~cpu7 off
> 
>     Change-Id: I0fcb5afefcc3865cf8c413b4c0ed00234d2675cb
>     Signed-off-by: XiaoDong Huang <derrick.huang@rock-chips.com>
> 
>  RKTRUST/RK3576TRUST.ini                                   |   2 +-
>  bin/rk35/{rk3576_bl31_v1.08.elf => rk3576_bl31_v1.09.elf} | Bin
> 349032 -> 349032 bytes
>  doc/release/RK3576_CN.md                                  |  13 +++++++++++++
>  doc/release/RK3576_EN.md                                  |  14 ++++++++++++++
>  4 files changed, 28 insertions(+), 1 deletion(-)
>  rename bin/rk35/{rk3576_bl31_v1.08.elf => rk3576_bl31_v1.09.elf} (82%)
> 
> [1] https://github.com/rockchip-linux/rkbin.git
> [2] https://github.com/ThomasKaiser/sbc-bench
> 
> Derrick, if you could chime in on what might be going on here, that
> would be greatly appreciated :)
> 
> Best regards,
> Alexey

