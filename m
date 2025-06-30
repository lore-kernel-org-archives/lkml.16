Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C624289839;
	Mon, 30 Jun 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286354; cv=none; b=ElFplLrIK5ETxmkdw99rN1yJcr0i+xySnP7b6i9vnuryaGSEOeTA0k2tja/GHtsmYycDJqj1UhK8yOGwyYA/bVyVgaTow4/x33aelk/lKZ/tzzPBKQDbxfnpWr8An/8zXWriJTiWnN0YLaoqwUQAo9ZGTJm0aAdC8ltneuUrkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286354; c=relaxed/simple;
	bh=wdctsAVA5CUH7qmuL1w8VIcpE6Q/ZsGQeTlo7JbV9/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnEIJ9dvxrV896QFLBUkMG/Mv3TqKaAtfmBHiJS8l2ShqUvic96oH6m4RjfLmhYNOaNCSHkjoBq46hvyYJQ5k0SEydLWKb+DDpeu3gjr6SuSTCuY8QBWfSGmTEhhupvGcPIncLW0Z3SY0RMqqVD4BYAUnS5OlKf4zHioDEroGGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=Cqmt2XJe; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="Cqmt2XJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LjM0YXPls02D9fN6ZaYgYgefCHGo2WaPUJpQ5dnPesc=; b=Cqmt2XJe9PbEOb5e/ILnbMuxqt
	lI9X/VFAV9xo7bm1I/2GDgefPSwMb1M0WceFNndGV4d3SN0kEMLlyT40O8HgDndMmM+PXJifOleNV
	U5AzPjNJtHX1TxqAA2/cZg5jaQhoc+ZOERm1ESpa3TQSf9A6m6xaCZyIfSdl/uTait3WZJ95Ahc51
	J6vmBB297hIrMaUJKuHBuidsiUIeZ4/tJq+twkpxuuEpdiB0hwAajonkAse74cjZwSpKWdg4lYQfc
	8s1UKo+fFY3N72Jpq2RrrbI2kPkWQON2rfXFX7L8Xf/PtU1Jax2xU+ny/MR5w9kodhq+2ZoLUYPlt
	TG6ULzUg==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:27046 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWDa0-00000000JhN-1aNK;
	Mon, 30 Jun 2025 14:25:48 +0200
Message-ID: <72488216-a847-4b41-b184-c699faec6b14@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 14:25:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Kannappan R <r.kannappan@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <CACzwLxiybz489fCY3+CSbU1=yPR7mKXCbDadK1E-p25onDAGkw@mail.gmail.com>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <CACzwLxiybz489fCY3+CSbU1=yPR7mKXCbDadK1E-p25onDAGkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 


On 6/21/25 13:09, Sabyrzhan Tasbolatov wrote:
> On Fri, Jun 20, 2025 at 7:27 PM <nicolas.bouchinet@oss.cyber.gouv.fr> wrote:
>> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>>
>> Plugs the usb authentication implementation in the usb stack and more
>> particularly in the usb_parse_configuration function after the BOS has
>> been parsed and the usb authentication capacity has been controlled.
>>
>> The authentication bulk is implemented by the usb_authenticate_device
>> function.
>>
>> The authorization decision enforcement is done via the authorized field of
>> the usb_device and the associated authorization and deauthorization functions.
>> The usb_device also contains an authenticated field that could be used to track
>> the result of the authentication process and allow for more complex security
>> policy: the user could manually authorize a device that failed the
>> authentication or manually deauthorize a device that was previously
>> authenticated.
>>
>> The usb_authenticate_device returns 0 or an error code. If 0 is
>> returned, the authorized and authenticated fields of the usb_device are
>> updated with the result of the authentication.
>>
>> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
>> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>> ---
>>   drivers/usb/core/config.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   drivers/usb/core/hub.c    |  6 ++++++
>>   drivers/usb/core/usb.c    |  5 +++++
>>   include/linux/usb.h       |  2 ++
>>   4 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index 13bd4ec4ea5f7a6fef615b6f50b1acb3bbe44ba4..45ee8e93e263c41f1bf4271be4e69ccfcac3f650 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/byteorder.h>
>>   #include "usb.h"
>>
>> +#include "authent.h"
>>
>>   #define USB_MAXALTSETTING              128     /* Hard limit */
>>
>> @@ -824,7 +825,50 @@ static int usb_parse_configuration(struct usb_device *dev, int cfgidx,
>>                  kref_init(&intfc->ref);
>>          }
>>
>> -       /* FIXME: parse the BOS descriptor */
>> +       /* If device USB version is above 2.0, get BOS descriptor */
>> +       /*
>> +        * Requirement for bcdUSB >= 2.10 is defined in USB 3.2 §9.2.6.6
>> +        * "Devices with a value of at least 0210H in the bcdUSB field of their
>> +        * device descriptor shall support GetDescriptor (BOS Descriptor) requests."
>> +        *
>> +        * To discuss, BOS request could be also sent for bcdUSB >= 0x0201
>> +        */
>> +       // Set a default value for authenticated at true in order not to block devices
>> +       // that do not support the authentication
>> +       dev->authenticated = 1;
>> +
>> +       if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
>> +               pr_notice("bcdUSB >= 0x0201\n");
>> +               retval = usb_get_bos_descriptor(dev);
>> +               if (!retval) {
>> +                       pr_notice("found BOS\n");
>> +#ifdef CONFIG_USB_AUTHENTICATION
>> +                       if (dev->bos->authent_cap) {
>> +                               /* If authentication cap is present, start device authent */
>> +                               pr_notice("found Authent BOS\n");
>> +                               retval = usb_authenticate_device(dev);
>> +                               if (retval != 0) {
>> +                                       pr_err("failed to authenticate the device: %d\n",
>> +                                              retval);
>> +                               } else if (!dev->authenticated) {
>> +                                       pr_notice("device has been rejected\n");
>> +                                       // return early from the configuration process
>> +                                       return 0;
> Returning 0 after rejecting a device leaves udev half-initialised and still
> linked in usb_bus_type (the hub driver only aborts after this call).
> The next hot-plug may oops on dangling pointers.
> Please consider returning -EPERM instead of 0.
We have changed the way we handle errors and 
authentication/authorization. It
will appear in the next version of the patch.
We have commented and explained how we want to proceed in reply to Alan [1].

[1]: 
https://lore.kernel.org/linux-usb/8cc10112-23a7-41af-b81f-7fc0c097d34d@oss.cyber.gouv.fr/

>
>> +                               } else {
>> +                                       pr_notice("device has been authorized\n");
>> +                               }
>> +                       } else {
>> +                               // USB authentication unsupported
>> +                               // Apply security policy on failed devices
>> +                               pr_notice("no authentication capability\n");
>> +                       }
>> +#endif
>> +               } else {
>> +                       // Older USB version, authentication not supported
>> +                       // Apply security policy on failed devices
>> +                       pr_notice("device does not have a BOS descriptor\n");
>> +               }
>> +       }
>>
>>          /* Skip over any Class Specific or Vendor Specific descriptors;
>>           * find the first interface descriptor */
>> @@ -1051,6 +1095,7 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>>          length = bos->bLength;
>>          total_len = le16_to_cpu(bos->wTotalLength);
>>          num = bos->bNumDeviceCaps;
>> +
>>          kfree(bos);
>>          if (total_len < length)
>>                  return -EINVAL;
>> @@ -1122,6 +1167,10 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>>                          dev->bos->ptm_cap =
>>                                  (struct usb_ptm_cap_descriptor *)buffer;
>>                          break;
>> +               case USB_AUTHENT_CAP_TYPE:
>> +                       dev->bos->authent_cap =
>> +                               (struct usb_authent_cap_descriptor *)buffer;
>> +                       break;
>>                  default:
>>                          break;
>>                  }
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 0e1dd6ef60a719f59a22d86caeb20f86991b5b29..753e55155ea34a7739b5f530dad429534e60842d 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -2640,6 +2640,12 @@ int usb_new_device(struct usb_device *udev)
>>          udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
>>                          (((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
>>
>> +       // TODO: Check the device state, we want to avoid semi-initialized device to userspace.
>> +       if (!udev->authenticated) {
>> +               // If the device is not authenticated, abort the procedure
>> +               goto fail;
>> +       }
>> +
>>          /* Tell the world! */
>>          announce_device(udev);
>>
>> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
>> index 0b4685aad2d50337f3cacb2198c95a68ae8eff86..76847c01d3493e2527992a3bb927422519d9a974 100644
>> --- a/drivers/usb/core/usb.c
>> +++ b/drivers/usb/core/usb.c
>> @@ -46,6 +46,7 @@
>>   #include <linux/dma-mapping.h>
>>
>>   #include "hub.h"
>> +#include "authent_netlink.h"
>>
>>   const char *usbcore_name = "usbcore";
>>
>> @@ -1080,6 +1081,10 @@ static int __init usb_init(void)
>>          usb_debugfs_init();
>>
>>          usb_acpi_register();
>> +
>> +       // TODO : check error case
>> +       usb_auth_init_netlink();
>> +
>>          retval = bus_register(&usb_bus_type);
>>          if (retval)
>>                  goto bus_register_failed;
>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>> index b46738701f8dc46085f251379873b6a8a008d99d..e9037c8120b43556f8610f9acb3ad4129e847b98 100644
>> --- a/include/linux/usb.h
>> +++ b/include/linux/usb.h
>> @@ -431,6 +431,8 @@ struct usb_host_bos {
>>          struct usb_ssp_cap_descriptor   *ssp_cap;
>>          struct usb_ss_container_id_descriptor   *ss_id;
>>          struct usb_ptm_cap_descriptor   *ptm_cap;
>> +       /* Authentication capability */
>> +       struct usb_authent_cap_descriptor *authent_cap;
>>   };
>>
>>   int __usb_get_extra_descriptor(char *buffer, unsigned size,
>>
>> --
>> 2.50.0
>>
