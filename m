Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38F2857EE;
	Fri,  6 Jun 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199082; cv=none; b=M/JPLDtG2vQp/1VVH3r0dxMaChU1nptPuhep8HLFiz88PC9WcsQzOT9GyzzQO463gEXQIk8ffYJJ+NGBtRGdPFZKZIL7nV7H838Sc7TolUAtY6qC8FT7epiyhE5dm90CkUVlJ3cg4n2Nt7X04jvp+I5/44gGMXNgx4Id873avxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199082; c=relaxed/simple;
	bh=PfMIQtD2NfHsxI/ChKmzAzQu2/rDSpMas0Z70Ufpb1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QtZphUzjG4VL9hAfAvtmKua1QLeQWTedPkbrcZhxT/9BbMDScfE78/MxU0FeJPasWPXJj0PuxGiZS/KBQUjeDi66bb7lbSfN9fRWuP9faTehRj7A59F0KVnvwyJj7hTM6NQRfZUKvH0+Jv4VcPV30leoKnRlHFskdbuEsAjbE2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K5rj3GIu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5rj3GIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F69DC4CEEB;
	Fri,  6 Jun 2025 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749199082;
	bh=PfMIQtD2NfHsxI/ChKmzAzQu2/rDSpMas0Z70Ufpb1s=;
	h=Date:From:To:Cc:Subject:From;
	b=K5rj3GIuBQVgkVcbgweP3brJGuQnb1f0NHszKgIKzfBwax54ulwPfKGeY5JipjtmE
	 XNURBrVbI1A5VlgYSjDMDk6NDtYrfWAKMm6JJwc7Jr8zCw49okTgMc8h9bXKQaW9PV
	 Sf8HmRd4AXOUDGrjuSzfix5NIq3BvDqDxgJnfFq0=
Date: Fri, 6 Jun 2025 10:37:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver changes for 6.16-rc1
Message-ID: <aEKo5zLupPYdXd6-@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc1

for you to fetch changes up to a481f0ebf213e0ccb85f70c07bfcd733d2dc6783:

  staging: rtl8723bs: remove unnecessary braces for single statement blocks (2025-05-21 13:49:17 +0200)

----------------------------------------------------------------
Staging driver updates for 6.16-rc1

Here is the "big" set of staging driver changes for 6.16-rc1.  Included
in here are:
  - gpib driver cleanups and updates.  This subsystem is _almost_ ready
    to be merged into the main portion of the kernel tree.  Hopefully
    should happen in the next kernel merge cycle if all goes well.
  - sm750fb driver cleanups
  - rtl8723bs driver cleanups
  - other small driver cleanups for coding style issues

All of these have been in for over 2 weeks with no reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abraham Samuel Adekunle (8):
      staging: bcm2835-camera: Modify function call formatting
      staging: rtl8723bs: simplify if-else block by removing unnecessary braces
      staging: rtl8723bs: remove unnecessary else block after return
      staging: rtl8723bs: remove braces around single statements
      staging: rtl8723bs: modify struct field to use standard bool type
      staging: rtl8723bs: Place constants on right side of comparison
      staging: rtl8723bs: Add spaces and line breaks to improve readability
      staging: rtl8723bs: Use % 4096 instead of & 0xfff

Andreas Kleinbichler (1):
      staging: gpib: switch to kmalloc(sizeof(*status))

Andy Shevchenko (3):
      staging: rtl8723bs: Fix compilation errors for W=1 build
      fbtft: Unorphan the driver
      fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'

Bartosz Golaszewski (1):
      staging: greybus: use new GPIO line value setter callbacks

Bryant Boatright (1):
      Staging: rtl8723bs: Fix unbalanced braces in conditional

Chen Ni (3):
      staging: gpib: eastwood: Remove unnecessary print function dev_err()
      staging: gpib: fmh_gpib: Remove unnecessary print function dev_err()
      staging: gpib: fmh_gpib: Remove unnecessary .owner assignment

Dave Penkler (18):
      staging: gpib: Remove unused enums from common include file
      staging: gpib: Rename common include file
      staging: gpib: Add return value to request_control
      staging: gpib: Fix request_system_control in gpio
      staging: gpib: Fix setting controller-in-charge
      staging: gpib: Enable SRQ irq on request_system_control
      staging: gpib: Remove dependency on LED subsystem
      staging: gpib: Remove atn_asserted global variable
      staging: gpib: Change error code for no listener
      staging: gpib: Cleanup allocate_gpios code
      staging: gpib: Set control lines in attach
      staging: gpib: Fix lpvo request_system_control
      staging: gpib: Avoid unused variable warnings
      staging: gpib: Fix PCMCIA config identifier
      staging: gpib: Declare driver entry points static
      staging: gpib: Avoid unused variable warning
      staging: gpib: Fix uapi include header guard name
      staging: gpib: Fix secondary address restriction

David Tadokoro (1):
      staging: rtl8723bs: remove unnecessary braces for single statement blocks

Eric Florin (16):
      staging: sm750fb: clean-up `else`-blocks
      staging: sm750fb: change `enum dpms` to snake_case
      staging: sm750fb: rename sm750_hw_cursor_setSize
      staging: sm750fb: rename sm750_hw_cursor_setPos
      staging: sm750fb: rename sm750_hw_cursor_setColor
      staging: sm750fb: rename sm750_hw_cursor_setData
      staging: sm750fb: rename sm750_hw_cursor_setData2
      staging: sm750fb: rename `hw_sm750_initAccel`
      staging: sm750fb: rename `hw_sm750_deWait`
      staging: sm750fb: rename `hw_sm750le_deWait`
      staging: sm750fb: rename `hw_sm750_output_setMode`
      staging: sm750fb: rename `hw_sm750_crtc_checkMode`
      staging: sm750fb: rename `hw_sm750_crtc_setMode`
      staging: sm750fb: rename `hw_sm750_setColReg`
      staging: sm750fb: rename `hw_sm750_setBLANK`
      staging: sm750fb: rename `hw_sm750le_setBLANK`

Erick Karanja (7):
      staging: greybus: camera: fix code alignment warning
      staging: rtl8723bs: Rename variables
      staging: rtl8723bs: add spaces between ternary and binary operators
      staging: rtl8723bs: use preferred comparison order
      staging: rtl8723bs: Initialize variables at declaration in rtl8723bs_xmit.c
      staging: rtl8723bs: Initialize variables at declaration in rtl8723b_hal_init.c
      staging: rtl8723bs: Use boolean false instead of integer 0

Gabriel Shahrouzi (1):
      staging: rtl8723bs: Remove trailing whitespace

Greg Kroah-Hartman (1):
      Merge 6.15-rc6 into staging-next

JJ Strnad (1):
      staging: rtl8723bs: remove multiple blank lines

Justin Cromer (1):
      staging: sm750fb: fix casing style on getDeviceID

Mark Brown (1):
      staging: bcm2835-audio: Validate values written to controls

Michael Rubin (110):
      staging: gpib: Correct CamelCase for EVENT enums
      staging: gpib: Correct CamelCase for PPConfig
      staging: gbip: Alignment should match open parens
      staging: gpib: common: lines exceeded 100 columns
      staging: gpib: nec: lines exceeded 100 columns
      staging: gpib: tms9914: lines exceeded 100 columns
      staging: gpib: ines: lines exceeded 100 columns
      staging: gpib: pc2: lines exceeded 100 columns
      staging: gpib: tnt4882: lines exceeded 100 columns
      staging: gpib: uapi: Fix CamelCase and IBA Dup
      staging: gpib: uapi: Fix CamelCase and IBC Dup
      staging: gpib: uapi: Fix CamelCase and IB_STB
      staging: gpib: nec: Fix Improper SPDX comment.
      staging: gpib: tms9914: Fix Improper SPDX comment.
      staing: gpib: struct typing for gpib_board_config
      staging: gpib: agilent_82350b: gpib_board_config
      staging: gpib: agilent_82357a: gpib_board_config
      staging: gpib: cb7210: struct gpib_board_config
      staging: gpib: cec: struct gpib_board_config
      staging: gpib: common: struct gpib_board_config
      staging: gpib: eastwood: struct gpib_board_config
      staging: gpib: fmh: struct gpib_board_config
      staging: gpib: gpio: struct gpib_board_config
      staging: gpib: hp_82335: struct gpib_board_config
      staging: gpib: hp_82341: struct gpib_board_config
      staging: gpib: gpibP: struct gpib_board_config
      staging: gpib: ines: struct gpib_board_config
      staging: gpib: lpvo_usb: struct gpib_board_config
      staging: gpib: ni_usb: struct gpib_board_config
      staging: gpib: pc2: struct gpib_board_config
      staging: gpib: tnt4882: struct gpib_board_config
      staging: gpib: Removing typedef gpib_board_config
      staging: gpib: agilent_82357a uses completion
      staging: gpib: Removing function osInit
      staging: gpib: Removing function osReset
      staging: gpib: Removing function osSendEOI
      staging: gpib: Removing function ibAPWait
      staging: gpib: Removing function ibaPrsp
      staging: gpib: Removing function ibAPE
      staging: gpib: Removing typedef gpib_event_queue
      staging: gpib: Removing gpib_interface_list_t
      staging: gpib: Removing gpib_event_t typedef
      staging: gpib: Removing typedef gpib_status_queue
      staging: gpib: Removing typedef of status_byte
      staging: gpib: Removing typedef gpib_descriptor_t
      staging: gpib: Remove typedef gpib_file_private_t
      staging: gpib: cb7210: u8 over uint8_t
      staging: gpib: ibsys: u8 over uint8_t
      staging: gpib: fluke_gpib: u8 over uint8_t
      staging: gpib: fmh_gpib: u8 over uint8_t
      staging: gpib: gpib_proto: u8 over uint8_t
      staging: gpib: gpib_types: u8 over uint8_t
      staging: gpib: nec7210: u8 over uint8_t
      staging: gpib: tms9914: u8 over uint8_t
      staging: gpib: ines: u8 over uint8_t
      staging: gpib: Using struct gpib_board_type_ioctl
      staging: gpib: Using struct gpib_read_write_ioctl
      staging: gpib: Using struct gpib_open_dev_ioctl
      staging: gpib: Using struct gpib_close_dev_ioctl
      staging: gpib: Using struct gpib_serial_poll_ioctl
      staging: gpib: Using struct gpib_eos_ioctl
      staging: gpib: Using struct gpib_wait_ioctl
      staging: gpib: Using struct gpib_online_ioctl
      staging: gpib: Using struct gpib_spoll_bytes_ioctl
      staging: gpib: Using struct gpib_board_info_ioctl
      staging: gpib: Using struct gpib_select_pci_ioctl
      staging: gpib: Using struct gpib_ppoll_config_ioctl`
      staging: gpib: Using struct gpib_pad_ioctl
      staging: gpib: Using struct gpib_sad_ioctl
      staging: gpib: Using gpib_select_device_path_ioctl
      staging: gpib: Using struct gpib_request_service2
      staging: gpib: event_ioctl_t now short
      staging: gpib: rsc_ioctl_t now int
      staging: gpib: t1_delay_ioctl_t now unsigned int
      staging: gpib: autospoll_ioctl_t now short
      staging: gpib: local_ppoll_mode_ioctl_t now short
      staging: gpib: gpib_ioctl: u8 over uint8_t
      staging: gpib: gpib_user: u8 over uint8_t
      staging: gpib: agilent_82350b: u8 over uint8_t
      staging: gpib: agilent_82357a: u8 over uint8_t
      staging: gpib: cec: u8 over uint8_t
      staging: gpib: gpib_os: u8 over uint8_t
      staging: gpib: gpib_bitbang: u8 over uint8_t
      staging: gpib: hp_82335: u8 over uint8_t
      staging: gpib: hp_82341: u8 over uint8_t
      staging: gpib: ni_usb: u8 over uint8_t
      staging: gpib: pc2: u8 over uint8_t
      staging: gpib: gpib_ioctl: u64 over uint64_t
      staging: gpib: lpvo_usb_gpib: u8 over uint8_t
      staging: gpib: tnt4882: u8 over uint8_t
      staging: gpib: struct typing for gpib_interface
      staging: gpib: agilent_82350b: gpib_interface
      staging: gpib: agilent_82357a: gpib_interface
      staging: gpib: cb7210: struct gpib_interface
      staging: gpib: cec: struct gpib_interface
      staging: gpib: common: struct gpib_interface
      staging: gpib: fluke: struct gpib_interface
      staging: gpib: fmh: struct gpib_interface
      staging: gpib: gpio: struct gpib_interface
      staging: gpib: hp_82335: struct gpib_interface
      staging: gpib: hp2341: struct gpib_interface
      staging: gpib: gpibP: struct gpib_interface
      staging: gpib: ines: struct gpib_interface
      staging: gpib: lpvo_usb: struct gpib_interface
      staging: gpib: ni_usb: struct gpib_interface
      staging: gpib: pc2: struct gpib_interface
      staging: gpib: tnt4882: struct gpib_interface
      staging: gpib: Removing typedef gpib_interface_t
      staging: gpib: uapi: Fix CamelCase and IBA Dup
      staging: gpib: Removing unused function CFGn

Paul Retourné (16):
      staging: gpib: agilent_82357a: fixes multiline comments style
      staging: gpib: cb7210: fixes multiline comments style
      staging: gpib: common: fixes multiline comments style
      staging: gpib: eastwood: fixes multiline comments style
      staging: gpib: fmh_gpib: fixes multiline comments style
      staging: gpib: gpio: fixes multiline comments style
      staging: gpib: hp_82335: fixes multiline comments style
      staging: gpib: hp_82341: fixes multiline comments style
      staging: gpib: ines: fixes multiline comments style
      staging: gpib: lpvo_usb_gpib: fixes multiline comments style
      staging: gpib: nec7210: fixes multiline comments style
      staging: gpib: ni_usb: fixes multiline comments style
      staging: gpib: pc2: fixes multiline comments style
      staging: gpib: tms9914: fixes multiline comments style
      staging: gpib: tnt4882: fixes multiline comments style
      staging: gpib: include: fixes multiline comments style

Richard Akintola (7):
      staging: sm750fb: change sii164ResetChip to snake_case
      staging: sm750fb: change sii164SetPower to snake_case
      staging: sm750fb: change sii164GetChipString to snake_case
      staging: sm750fb: change sii164EnableHotPlugDetection to snake_case
      staging: sm750fb: change sii164IsConnected to snake_case
      staging: sm750fb: change sii164CheckInterrupt to snake_case
      staging: sm750fb: change sii164ClearInterrupt to snake_case

Rogério Fernandes Pereira (1):
      staging: rtl8723bs: Removed multiple blank lines of rtw_pwrctrl.c

Ruben Wauters (5):
      staging: gpib: agilent_02350b: cleanup comments
      staging: sm750fb: Remove ddk750_sii164
      staging: sm750fb: remove ddk750_dvi
      staging: sm750fb: remove ddk750_hwi2c
      staging: sm750fb: remove irrelevant TODO line

Thorsten Blum (1):
      staging: greybus: Check for string truncation instead of NUL-termination

 MAINTAINERS                                        |   3 +-
 drivers/staging/fbtft/Kconfig                      |  35 +-
 .../staging/gpib/agilent_82350b/agilent_82350b.c   |  86 ++---
 .../staging/gpib/agilent_82350b/agilent_82350b.h   |  28 +-
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  76 ++--
 .../staging/gpib/agilent_82357a/agilent_82357a.h   |   4 +-
 drivers/staging/gpib/cb7210/cb7210.c               |  74 ++--
 drivers/staging/gpib/cb7210/cb7210.h               |  26 +-
 drivers/staging/gpib/cec/cec_gpib.c                |  26 +-
 drivers/staging/gpib/common/gpib_os.c              | 316 ++++++++--------
 drivers/staging/gpib/common/iblib.c                |  60 +--
 drivers/staging/gpib/common/ibsys.h                |  13 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c         | 107 +++---
 drivers/staging/gpib/eastwood/fluke_gpib.h         |  29 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c           | 144 +++++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h           |   6 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c           | 142 ++++---
 drivers/staging/gpib/hp_82335/hp82335.c            |  35 +-
 drivers/staging/gpib/hp_82341/hp_82341.c           |  52 +--
 drivers/staging/gpib/include/gpibP.h               |  14 +-
 drivers/staging/gpib/include/gpib_proto.h          |  31 +-
 drivers/staging/gpib/include/gpib_types.h          | 162 ++++----
 drivers/staging/gpib/include/nec7210.h             |  40 +-
 drivers/staging/gpib/include/nec7210_registers.h   |   3 +-
 drivers/staging/gpib/include/tms9914.h             |  37 +-
 drivers/staging/gpib/ines/ines.h                   |  43 ---
 drivers/staging/gpib/ines/ines_gpib.c              | 216 +++++------
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 145 ++++----
 drivers/staging/gpib/nec7210/nec7210.c             |  72 ++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  70 ++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.h          |  32 +-
 drivers/staging/gpib/pc2/pc2_gpib.c                |  46 +--
 drivers/staging/gpib/tms9914/tms9914.c             |  69 ++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c        | 106 +++---
 drivers/staging/gpib/uapi/{gpib_user.h => gpib.h}  | 226 +++++-------
 drivers/staging/gpib/uapi/gpib_ioctl.h             | 134 ++++---
 drivers/staging/greybus/camera.c                   |   4 +-
 drivers/staging/greybus/fw-management.c            |  48 +--
 drivers/staging/greybus/gpio.c                     |  16 +-
 drivers/staging/rtl8723bs/core/rtw_ap.c            |   2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c        |  12 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |  11 +-
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |   5 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          |  10 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |   2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |   8 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          |   6 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c          |  18 +-
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  68 ++--
 drivers/staging/rtl8723bs/hal/hal_btcoex.c         |  22 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |  11 +-
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c    |   4 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c            |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  81 ++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c     |  33 +-
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h    |   2 +-
 drivers/staging/rtl8723bs/include/sta_info.h       |   2 +-
 drivers/staging/rtl8723bs/os_dep/recv_linux.c      |  13 +-
 drivers/staging/sm750fb/Makefile                   |   3 +-
 drivers/staging/sm750fb/TODO                       |   3 -
 drivers/staging/sm750fb/ddk750.h                   |   3 -
 drivers/staging/sm750fb/ddk750_display.c           |   1 -
 drivers/staging/sm750fb/ddk750_dvi.c               |  62 ----
 drivers/staging/sm750fb/ddk750_dvi.h               |  57 ---
 drivers/staging/sm750fb/ddk750_hwi2c.c             | 247 -------------
 drivers/staging/sm750fb/ddk750_hwi2c.h             |  12 -
 drivers/staging/sm750fb/ddk750_power.h             |   8 +-
 drivers/staging/sm750fb/ddk750_sii164.c            | 408 ---------------------
 drivers/staging/sm750fb/ddk750_sii164.h            | 174 ---------
 drivers/staging/sm750fb/sm750.c                    |  24 +-
 drivers/staging/sm750fb/sm750.h                    |  30 +-
 drivers/staging/sm750fb/sm750_cursor.c             |  14 +-
 drivers/staging/sm750fb/sm750_cursor.h             |  12 +-
 drivers/staging/sm750fb/sm750_hw.c                 |  38 +-
 .../vc04_services/bcm2835-audio/bcm2835-ctl.c      |   6 +
 .../vc04_services/bcm2835-camera/controls.c        |  14 +-
 76 files changed, 1592 insertions(+), 2612 deletions(-)
 rename drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} (50%)
 delete mode 100644 drivers/staging/sm750fb/ddk750_dvi.c
 delete mode 100644 drivers/staging/sm750fb/ddk750_dvi.h
 delete mode 100644 drivers/staging/sm750fb/ddk750_hwi2c.c
 delete mode 100644 drivers/staging/sm750fb/ddk750_hwi2c.h
 delete mode 100644 drivers/staging/sm750fb/ddk750_sii164.c
 delete mode 100644 drivers/staging/sm750fb/ddk750_sii164.h
